import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework12/Screen/message_screen.dart';
import 'package:homework12/bloc/chat_bloc.dart';
import 'package:homework12/bloc/chat_state.dart';
import 'package:homework12/local/local_storage.dart';
import 'package:homework12/model/contact_model.dart';
import 'package:homework12/model/message_model.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';
import 'package:homework12/utils/icons/icon.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Conversations',
          style: AppTextStyle.interMedium.copyWith(
            color: AppColors.black,
            fontSize: 26,
          ),
        ),
        actions: [
          SvgPicture.asset(
            AppImages.plus,
            color: AppColors.black,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: BlocBuilder<ChatBloc, ChatState>(builder: (context, state) {
        if (state is InitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DownloadAllState) {
          return Column(
            children: [
              SizedBox(
                  height: 140,
                  child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3, color: Colors.redAccent),
                                  borderRadius: BorderRadius.circular(18)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset(
                                  AppImages.fon,
                                  width: 56,
                                  fit: BoxFit.cover,
                                  height: 56,
                                ),
                              ),
                            ),
                            const Text("Your history"),
                          ],
                        ),
                        ...List.generate(state.contacts.length, (index) {
                          ContactModel contact = state.contacts[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 3, color: Colors.redAccent),
                                      borderRadius: BorderRadius.circular(18)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                                    child: Image.asset(
                                      AppImages.fon,
                                      fit: BoxFit.cover,
                                      width: 56,
                                      height: 56,
                                    ),
                                  ),
                                ),
                                Text(contact.contactName),
                              ],
                            ),
                          );
                        })
                      ])),
              Container(
                width: double.infinity,
                color: AppColors.black.withOpacity(0.4),
                height: 1,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFFF7F7FC)),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  style: AppTextStyle.interMedium
                      .copyWith(color: AppColors.black, fontSize: 16),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      hintStyle: AppTextStyle.interMedium.copyWith(
                        color: AppColors.black.withOpacity(0.5),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView(
                children: [
                  ...List.generate(state.contacts.length, (index) {
                    ContactModel contact = state.contacts[index];
                    return ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (contact) {
                          return MessageScreen(
                              contactModel: state.contacts[index]);
                        }));
                      },
                      title: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                AppImages.fon,
                                width: 56,
                                height: 56,
                                fit: BoxFit.cover,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              (StorageRepository.getString(key: 'name')==contact.contactName)?"Saved Message":"${contact.contactName} ${contact.contactLasName}",
                                style: AppTextStyle.interMedium.copyWith(
                                    color: AppColors.black, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text('ads')
                            ],
                          )
                        ],
                      ),
                    );
                  })
                ],
              )),
            ],
          );
        }
        return SizedBox();
      }),
    );
  }
}
