import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework12/bloc/chat_bloc.dart';
import 'package:homework12/bloc/chat_event.dart';
import 'package:homework12/bloc/chat_state.dart';
import 'package:homework12/local/local_storage.dart';
import 'package:homework12/model/contact_model.dart';
import 'package:homework12/model/message_model.dart';
import 'package:homework12/utils/color/color.dart';
import 'package:homework12/utils/fonts/fonts.dart';


class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.contactModel});
  final ContactModel contactModel;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
          icon: const Icon(Icons.arrow_back_ios_new, size: 20,),
        ),
        title: Text(widget.contactModel.contactName,
          style: AppTextStyle.interMedium.copyWith(
              color: AppColors.black, fontSize: 20
          ),),
        leadingWidth: 30,
        actions: const[
          Icon(Icons.search),
          SizedBox(width: 10,),
          Icon(Icons.menu),
          SizedBox(width: 10,)
        ],
        elevation: 1,
      ),
      body: BlocBuilder<ChatBloc,ChatState>(
        builder: (context,state){
          if(state is InitialState){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is DownloadAllState){
            List<MessageModel> list=state.messages.where((element) =>element.contactId==widget.contactModel.contactId).toList();
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    children: List.generate(list.length, (index) {
                      MessageModel messageModel=list[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            (messageModel.who==StorageRepository.getString(key: 'name'))
                                ? const SizedBox()
                                : Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            width: 1, color: AppColors.black)
                                    ),
                                    child: Text(
                                      messageModel.messageText, maxLines: 4,))),
                            const Spacer(),
                            (messageModel.who==StorageRepository.getString(key: 'name'))
                                ? Expanded(child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: AppColors.black),
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Text(messageModel.messageText, maxLines: 4,)))
                                : const SizedBox(),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    const Icon(Icons.add),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFFF7F7FC)
                      ),
                      child: SizedBox(
                        width: 290,
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10,horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none
                              )
                          ),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {
                      context.read<ChatBloc>().add(AddMessage(
                          messageModel: MessageModel(
                            userId: '',
                            who: StorageRepository.getString(key:'name'),
                            createdTime:DateTime.now().toIso8601String(),
                            messageText:controller.text,
                            messageId:1,
                            isFile: false,
                            contactId:(widget.contactModel.contactId==null)?0:widget.contactModel.contactId,
                            status:false,)));
                      controller.text='';
                    }, icon: const Icon(Icons.send))
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            );
          }
          return SizedBox();
        }
      ),
    );
  }
}
