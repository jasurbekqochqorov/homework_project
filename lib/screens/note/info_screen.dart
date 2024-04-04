import 'package:flutter/material.dart';
import 'package:homework12/data/models/note_model.dart';
import 'package:homework12/screens/note/update_note_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, this.noteModel});
  final NoteModel? noteModel;
  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text('Info',style: AppTextStyle.interMedium.copyWith(
          color: AppColors.white,fontSize: 34
        ),),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return UpdateNotesScreen(noteModel: widget.noteModel,);
                }));
              },
              icon:const Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(widget.noteModel!.title,style: AppTextStyle.interBold.copyWith(
            color: AppColors.white,fontSize: 40
          ),),
          const SizedBox(height: 20,),
          Text(widget.noteModel!.subtitle,style: AppTextStyle.interBold.copyWith(
            color: AppColors.white,fontSize: 24
          ),),
        ],),
      ),
    );
  }
}
