import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/models/note_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

import '../../blocs/note/note_bloc.dart';
import '../../blocs/note/note_event.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  TextEditingController titleController=TextEditingController();
  TextEditingController subTitleController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.1),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          style: IconButton.styleFrom(
            backgroundColor: AppColors.white.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )
          ),
        icon: const Icon(Icons.arrow_back_ios_new,color: AppColors.white,),),
        backgroundColor: AppColors.black.withOpacity(0.1),
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder:(context){
              return AlertDialog(
                content: Text('Are you sure',style: AppTextStyle.interRegular.copyWith(
                  color: AppColors.black,fontSize:18
                ),),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  },child: const Text('CANCEL'),),
                  TextButton(onPressed: (){
                    if(titleController.text.isNotEmpty && subTitleController.text.isNotEmpty){
                      NoteModel noteModel=NoteModel(
                          title: titleController.text,
                          subtitle:subTitleController.text,
                          color:"Colors.red");
                      context.read<NoteBloc>().add(SaveNoteEvent(noteModel:noteModel));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Success'))
                      );
                      Navigator.pop(context);
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Error')),
                      );
                        Navigator.pop(context);
                    }
                    Navigator.pop(context);
                  },child: const Text('OK'),),
                ],
                // backgroundColor: AppColors.white,
              );
            });
          },
            style: IconButton.styleFrom(
              backgroundColor: AppColors.white.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            ),
            icon:const Icon(Icons.save),color: AppColors.white,)
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal:24,vertical:10),
          child: Column(children: [
            const SizedBox(height:10,),
            TextField(
              controller: titleController,
              maxLines: null,
              style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize:40
              ),
              decoration: InputDecoration(
                hintText:'TITLE',
                hintStyle: AppTextStyle.interRegular.copyWith(
                  color: AppColors.white,fontSize:40
                ),
                border:const OutlineInputBorder(
                  borderSide: BorderSide.none
                )
              ),
            ),
            TextField(
              controller: subTitleController,
              maxLines: null,
              style: AppTextStyle.interRegular.copyWith(
                  color: AppColors.white,fontSize:20
              ),
              decoration: InputDecoration(
                  hintText:'Type something',
                  hintStyle: AppTextStyle.interRegular.copyWith(
                      color: AppColors.white,fontSize:24
                  ),
                  border:const OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            )
          ],),
        ),
      ),
    );
  }
}
