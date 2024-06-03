import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class FlickVideoView extends StatefulWidget {
  const FlickVideoView({super.key});
  @override
  State<FlickVideoView> createState() => _FlickVideoViewState();
}
class _FlickVideoViewState extends State<FlickVideoView> {
  late FlickManager flickManager ;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
        VideoPlayerController.networkUrl(Uri.parse
          ('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
    ),);
  }
  @override
void dispose(){
    super.dispose();
    flickManager.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlickVideoPlayer(
          flickManager: flickManager
      ),
    );
  }
}
