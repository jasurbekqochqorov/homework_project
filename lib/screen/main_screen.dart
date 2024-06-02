import 'dart:ffi';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homework12/Screen/music_screen.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/permission_utils/app_permissions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final player = AudioPlayer();
  FilePickerResult? result;
  List<PlatformFile> allSong = [];

  @override
  void initState() {
    super.initState();
    // Initialize the player with a default URL
    init();
    // Request permission and pick audio file on startup
  }

  Future<void> init() async {
    try {
      await player.setUrl(
          "https://file.uzhits.net/music/dl2/2016/10/21/Subxan_va_Shaxnoza_-_Sen_tomon_(uzhits.net).mp3");
    } catch (e) {
      debugPrint("Error setting URL: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio screen "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                AppPermissions.getStoragePermission();
              },
              child: Text("STORAGE ${allSong.length}"),
            ),
            TextButton(
              onPressed: () async {
                await AppPermissions.getAudioPermission();
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles(type: FileType.audio);
                if (result != null) {
                  setState(() {
                    allSong = result.files;
                    debugPrint(
                        "Files selectedDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD: ${allSong.length}");
                  });
                } else {
                  // User canceled the picker
                  debugPrint('No file selected');
                }
                setState(() {});
              },
              child: Text("Audio ${allSong.length}"),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: allSong.length,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text(
            //           "Sen tamom $index",
            //           style: AppTextStyle.interMedium
            //               .copyWith(color: AppColors.black),
            //         ),
            //         subtitle: const Text("Best guruhi"),
            //         onTap: () async {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) {
            //             return const MusicPlayerScreen();
            //           }));
            //           try {
            //             await player.setFilePath(allSong[index].path!);
            //             await player.play();
            //           } catch (e) {
            //             debugPrint("Error playing selected file: $e");
            //           }
            //         },
            //       );
            //     },
            //   ),
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
              width:double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.camera,color:Colors.white,),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("10,000.00 USD",style: TextStyle(color: Colors.white),),
                          Text("To 303,300.00 USD",style: TextStyle(color: Colors.white),),
                        ],
                      )
                    ],
                  ),
                  TextField(
                    maxLines:null,
                    decoration: InputDecoration(
                      hintText: "Practic Mode",
                      hintStyle: TextStyle(
                        color: Colors.white,fontSize: 24
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      suffixIcon: Icon(Icons.account_circle_sharp)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
