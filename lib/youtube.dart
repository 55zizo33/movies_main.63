import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YoutubeView extends StatefulWidget {
  const YoutubeView({super.key});

  @override
  State<YoutubeView> createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  final _controller = YoutubePlayerController(
    initialVideoId: 'Y1M6hJHHrjM',
    flags: YoutubePlayerFlags(
      autoPlay: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
        onReady: () {
          _controller.addListener((){
            setState(() {

            });
          },);
        },
      ),
    );
  }
}
