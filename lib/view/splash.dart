import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zack_shoping/view/home.dart';
import 'package:zack_shoping/view/sigin.dart';

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
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('lib/Asset/video/1717047772839705.mp4')
          ..initialize().then((_) {
            setState(() {
              _isInitialized = true;
            });
            _controller.setLooping(false); // Only play the video once
            _controller.play();
            _controller.addListener(_checkVideoPosition);
          });
  }

  @override
  void dispose() {
    _controller.removeListener(_checkVideoPosition);
    _controller.dispose();
    super.dispose();
  }

  // Check video position and navigate after 20 seconds or when video ends
  void _checkVideoPosition() {
    if (_controller.value.position.inSeconds >= 20 || 
        _controller.value.position >= _controller.value.duration) {
      _navigateToNextScreen();
    }
  }

  // Method to check login status and navigate accordingly
  Future<void> _navigateToNextScreen() async {
    String? isLogged = await storage.read(key: 'isLogged'); // Read login status

    if (mounted) {
      _controller.pause(); // Pause video playback

      if (isLogged != null) {
        // If logged in, navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // If not logged in, navigate to the login screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginscreen()),
        );
      }
    }
  }

  // Toggle mute/unmute
  void _toggleMute() {
    setState(() {
      if (_isMuted) {
        _controller.setVolume(1.0);
      } else {
        _controller.setVolume(0.0);
      }
      _isMuted = !_isMuted;
    });
  }

  // Handle swipe up
  void _onVerticalDragEnd(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      // User swiped up, navigate to the next screen
      _navigateToNextScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: _onVerticalDragEnd, // Detect swipe up
        child: Stack(
          children: [
            Container(
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
            // Mute/Unmute Button
            Positioned(
              top: size.height * 0.05,
              right: size.width * 0.05,
              child: IconButton(
                icon: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: _toggleMute,
              ),
            ),
            // Swipe Up Hint
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: const Column(
                children: [
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    "Swipe up to explore",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
