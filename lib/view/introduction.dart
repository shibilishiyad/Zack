import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class IntroductionScreen extends StatefulWidget {
  final bool autoPlay;

  const IntroductionScreen({super.key, this.autoPlay = false});

  @override
  IntroductionScreenState createState() => IntroductionScreenState();
}

// Expose this class publicly so you can use it in your GlobalKey
class IntroductionScreenState extends State<IntroductionScreen> {
  late VideoPlayerController _controller;
  double defaultVolume = 0.2;
  
  bool isMuted = false;

  @override
  void initState() {
    super.initState();

    // Initialize the video player
    _controller = VideoPlayerController.asset(
        'lib/Asset/video/af8b4c887b52afb86a9e5035f022a3de.mp4')
      ..initialize().then((_) {
        _controller.setLooping(true); // Enable looping
        _controller.setVolume(defaultVolume); // Set default volume
        if (widget.autoPlay) {
          _controller.play();
        }
        setState(() {}); // Refresh UI after initialization
      });
  }

  // Public method to pause the video
  void pauseVideo() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    }
  }

  // Public method to play the video
  void playVideo() {
    if (!_controller.value.isPlaying) {
      _controller.play();
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video player
    super.dispose();
  }

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
      _controller.setVolume(isMuted ? 0.0 : defaultVolume);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'lib/Asset/image/zackwear.png',
                color: Colors.white.withOpacity(.1 ),
              )),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _toggleMute,
              backgroundColor: Colors.black.withOpacity(0.7),
              child: Icon(
                isMuted ? Icons.volume_off : Icons.volume_up,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
