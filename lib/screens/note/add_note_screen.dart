import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/data/models/note_model.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/styles/app_text_style.dart';

import '../../blocs/note/note_bloc.dart';
import '../../blocs/note/note_event.dart';
import '../../data/global/global_list.dart';

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
      body:  SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal:27,vertical:10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height:55,),
            Row(children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              },
                style: IconButton.styleFrom(
                    backgroundColor:AppColors.white.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )
                ),
                icon: const Icon(Icons.arrow_back_ios_new,color: AppColors.white,),),
              const Spacer(),
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
                              color:list[Random().nextInt(list.length-1)]);
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
                icon:const Icon(Icons.save),color: AppColors.white,),
            ],),
            const SizedBox(height:40,),
            TextField(
              controller: titleController,
              maxLines: null,
              style: AppTextStyle.interRegular.copyWith(
                color: AppColors.white,fontSize:35
              ),
              decoration: InputDecoration(
                hintText:'TITLE',
                hintStyle: AppTextStyle.interRegular.copyWith(
                  color: const Color(0xFF9A9A9A),fontSize:35
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
                  color:Colors.white,fontSize:23
              ),
              decoration: InputDecoration(
                  hintText:'Type something',
                  hintStyle: AppTextStyle.interRegular.copyWith(
                      color:const Color(0xFF9A9A9A),fontSize:23
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
