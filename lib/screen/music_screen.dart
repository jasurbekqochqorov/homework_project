import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {

  const MusicPlayerScreen({super.key});

  @override
  MusicPlayerScreenState createState() => MusicPlayerScreenState();
}

class MusicPlayerScreenState extends State<MusicPlayerScreen> {
  bool isPlay=false;
   final player = AudioPlayer();
   Future<void> init() async {
   try {
   await player.setUrl("https://file.uzhits.net/music/dl2/2016/10/21/Subxan_va_Shaxnoza_-_Sen_tomon_(uzhits.net).mp3");
   } catch (e) {
     debugPrint("Error setting URL: $e");
   }
   }
  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    bool play = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),

          const SizedBox(height: 20),
    const  Text(
           " widget.music.name",
            style:  TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
         const  Text(
            "widget.music.artist",
            style:  TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.replay_10,size: 40,),
                onPressed: () =>
                    player.seek(player.position - const Duration(seconds: 10)),
              ),
              IconButton(
                icon:  Icon((!isPlay)?Icons.play_arrow:Icons.pause,size: 40,),
                onPressed: () {
                  isPlay=!isPlay;
                  if(isPlay){
                  player.play();
                  }
                  else{
                    player.pause();
                  }
                  setState(() {});
                },
              ),
              IconButton(
                icon:  const Icon(Icons.forward_10,size: 40,),
                onPressed: () {
                  player.seek(
                    player.position + const Duration(seconds: 10),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
