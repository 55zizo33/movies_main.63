import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class PlayVideoView extends StatefulWidget {
  const PlayVideoView({super.key});
  @override
  State<PlayVideoView> createState() => _PlayVideoViewState();
}
class _PlayVideoViewState extends State<PlayVideoView> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:_controller.value.isInitialized?
        FloatingActionButton(
        onPressed: () {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
          setState(() {
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),

      ):null,
      body: SafeArea(
        child: Column(
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
                :Center(child:CircularProgressIndicator() ,),
            IconButton(onPressed: ()async{
            await  _controller.setPlaybackSpeed(2);

            }
                , icon: Icon(Icons.speed))
          ],
        ),
      ),
    );
  }
}
