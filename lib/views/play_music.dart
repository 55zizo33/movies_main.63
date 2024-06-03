import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:project/design/app_image.dart';
class PlayMusicView extends StatefulWidget {
  const PlayMusicView({Key? key}) : super(key: key);
  @override
  State<PlayMusicView> createState() => _PlayMusicViewState();
}
class _PlayMusicViewState extends State<PlayMusicView> {
  final player = AudioPlayer();
  double speed=1;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }
  Future<void> initPlayer() async {
    await player.setUrl("https://server9.mp3quran.net/omran/001.mp3");
    print("*" * 50);
    print(player.duration?.inSeconds);

    player.positionStream.listen((event) {
      setState(() {});
    });
    player.playerStateStream.listen((event) async {
      print("-----");
      if (event.processingState == ProcessingState.completed) {
        await player.stop();
        await player.seek(Duration.zero);
      }
      print(event);
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030303),
      body: Column(
        children: [
          Expanded(
            child: APPImage(
              "https://images.inc.com/uploaded_files/image/1920x1080/getty_626660256_2000108620009280158_388846.jpg",
              height: 492,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 24),
          Text(
            "All of the light",
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
          Text(
            "Kanye West",
            style: TextStyle(fontSize: 20, color: Color(0xff868686)),
          ),
          SizedBox(height: 80),
          player.duration == null
              ? Center(child: CircularProgressIndicator())
              : Slider(
            value: player.position.inSeconds.toDouble(),
            min: 0,
            activeColor: Colors.red,
            divisions: player.duration!.inSeconds~/10,
            label: "Second${player.position.inSeconds}",
            inactiveColor: Color(0xff808080),
            max: player.duration!.inSeconds.toDouble(),
            onChanged: (value) async {
              await player.seek(Duration(seconds: value.toInt()));
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  "00:${(player.position.inSeconds % 60).toString().padLeft(2, "0")}",
                  style: TextStyle(fontSize: 12, color: Color(0xff868686)),
                ),
                Spacer(),
                Text(
                  "00:${(player.duration?.inSeconds ?? 0 % 60).toString().padLeft(2, "0")}",
                  style: TextStyle(fontSize: 12, color: Color(0xff868686)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              APPImage("previous.svg"),
              GestureDetector(
                onTap: () async {
                  if (player.playing) {
                    await player.pause();
                  } else {
                    await player.play();
                  }
                  setState(() {}); // Update play/pause button
                },
                child: player.playing ? APPImage("pause.svg") : APPImage("play.svg"),
              ),
              APPImage("next.svg"),
              IconButton(onPressed: ()async{
                speed  +=.5;
              await player.setSpeed(speed);
                setState(() {
                });
             //   await  _controller.setPlaybackSpeed(2);
              }
                  , icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.speed,color: Colors.white,),
                      Text("$speed",style: TextStyle(color: Colors.white)),
                    ],
                  ))
            ],
          ),
          SizedBox(height: 36),
        ],
      ),
    );
  }
}
