import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/blocs/note/note_event.dart';
import 'package:homework12/data/models/note_model.dart';
import 'package:homework12/screens/note/add_note_screen.dart';
import 'package:homework12/screens/note/info_screen.dart';
import 'package:homework12/utils/colors/app_colors.dart';
import 'package:homework12/utils/images/app_images.dart';
import 'package:homework12/utils/styles/app_text_style.dart';
import '../../blocs/note/note_bloc.dart';
import '../../blocs/note/note_state.dart';
import '../../data/global/global_list.dart';



class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: AppColors.black.withOpacity(0.1),
        elevation: 0,
        title: Text('Notes',style: AppTextStyle.interBold.copyWith(
          color: AppColors.white,fontSize:40
        ),),
        actions: [
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor:Colors.white.withOpacity(0.4)
              ),
              onPressed: (){},
              icon:const Icon(Icons.search,color: AppColors.white,)),
          IconButton(
              style: IconButton.styleFrom(
                  backgroundColor:Colors.white.withOpacity(0.4)
              ),
              onPressed: (){},
              icon:const Icon(Icons.info,color: AppColors.white,)),
        ],
      ),
      body: Column(children: [
        BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            if (state is CurrencyLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CurrencyErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.errorText),
                ],
              );
            } else if (state is CurrencySuccessState) {
              if(state.notes.isEmpty){
                return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:100,),
                  Image.asset(AppImages.img),
                  SizedBox(height:10,),
                  Text("Create your first note !",style: AppTextStyle.interRegular.copyWith(
                    color: Colors.white,fontSize:24
                  ),)
                ],),);
              }

              return Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal:24,vertical:8),
                  children: [
                    const SizedBox(height:30,),
                    ...List.generate(state.notes.length, (index) {
                    NoteModel noteModel = state.notes[index];
                    return Padding(
                      padding:  const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return InfoScreen(noteModel: noteModel,);
                          }));
                        },
                        trailing: IconButton(onPressed: (){
                          showDialog(context: context, builder:(context){
                            return AlertDialog(
                              content: const Text("Do you want to delete"),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child:const Text("Cancel")),
                                TextButton(onPressed: (){
                                  context.read<NoteBloc>().add(DeleteNoteEvent(noteId: noteModel.id!));
                                  Navigator.pop(context);
                                }, child:const Text('ok')),
                              ],
                            );
                          });
                        },icon: const Icon(Icons.delete,color: Colors.white,),),
                        // tileColor:noteModel.color.value.toString().toColor(),
                        title: Text(
                            noteModel.title,style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.white,fontSize:24
                        ),),
                        subtitle: Text(noteModel.subtitle,style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.white,fontSize: 16
                        ),),
                      ),
                    );
                  })],
                ),
              );
            }
            debugPrint(state.toString());
            return const SizedBox();
          },
        ),
      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return const AddNotesScreen();
          }));
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
