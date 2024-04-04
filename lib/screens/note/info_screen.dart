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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height:50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.white.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                  ),
                  icon:const Icon(Icons.arrow_back_ios_new,color: AppColors.white,)),
              Text('Info',style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.white,fontSize: 34
              ),),
              IconButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder:(context){
                      return UpdateNotesScreen(noteModel: widget.noteModel,);
                    }));
                  },
                  style: IconButton.styleFrom(
                      backgroundColor: AppColors.white.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                  icon:const Icon(Icons.edit,color: AppColors.white,))
            ],),
          const SizedBox(height:50,),
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
