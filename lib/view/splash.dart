import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zack_shoping/view/bottombar.dart';
import 'package:zack_shoping/view/login.dart';

// Create a storage instance for login data
const storage = FlutterSecureStorage();

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  VideoScreenState createState() => VideoScreenState();
}

class VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasNavigated = false; // To prevent multiple navigation calls

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('lib/Asset/video/1730817185246958.mp4')
          ..initialize().then((_) {
            setState(() {
              _isInitialized = true;
            });
            _controller.setLooping(false);
            _controller.play();
            _controller.addListener(_checkVideoCompletion);
          });
  }

  @override
  void dispose() {
    _controller.removeListener(_checkVideoCompletion);
    _controller.dispose();
    super.dispose();
  }

  // Check if video has completed and navigate
  void _checkVideoCompletion() {
    if (_controller.value.position >= _controller.value.duration) {
      _navigateToNextScreen();
    }
  }

  // Method to check login status and navigate accordingly
  Future<void> _navigateToNextScreen() async {
    if (mounted && !_hasNavigated) {
      _hasNavigated = true; // Ensure this is called only once
      _controller.pause(); // Pause video playback

      await Future.delayed(Duration(milliseconds: 100));

      // Check the Firebase authentication state
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          // If the user is logged in, navigate to the home screen (ExploreScreen)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MainBottombar(initialIndex: 0)),
          );
        } else {
          // If the user is not logged in, navigate to the login screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Loginscreen()), // Your login screen
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
              child: Center(
                child: _isInitialized
                    ? SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover, // Cover entire screen
                          child: SizedBox(
                            width: _controller.value.size.width,
                            height: _controller.value.size.height,
                            child: VideoPlayer(_controller),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(), // Show loading indicator
              ),
            ),
          ),
        ],
      ),
    );
  }
}
