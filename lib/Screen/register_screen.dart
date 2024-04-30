import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/Screen/main_screen.dart';
import 'package:homework12/bloc/chat_bloc.dart';
import 'package:homework12/bloc/chat_event.dart';
import 'package:homework12/bloc/chat_state.dart';
import 'package:homework12/local/local_storage.dart';
import 'package:homework12/model/contact_model.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // FirebaseService firebase = FirebaseService();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  init(){
    debugPrint("ASDFasfaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${StorageRepository.getString(key: 'name')}");
    if(StorageRepository.getString(key: 'name').isNotEmpty && StorageRepository.getString(key: 'surname').isNotEmpty){
      return Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
        return const MainScreen();
      }));
    }
  }
  @override
  void initState() {
    init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ChatBloc,ChatState>(
        builder: (context,state){
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.black)
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                        hintText: "Last Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.black)
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(onPressed: () {
                    StorageRepository.setString(key: 'name', value:nameController.text);
                    StorageRepository.setString(key: 'lastName', value:lastNameController.text);
                    context.read<ChatBloc>().add(AddContact(contactModel:ContactModel(
                      userId: '',
                      contactId:2,
                      contactLasName:lastNameController.text,
                      contactName:nameController.text,)));
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                    return const MainScreen();
                  }));
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 16),
                      backgroundColor: AppColors.blue,
                    ),
                    child: Text(
                      "Register", style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.white, fontSize: 24
                    ),),)
                ],),
            ),
          );
        }
      ),
    );
  }
}
