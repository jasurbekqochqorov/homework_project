import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:homework12/Screen/main_screen.dart';
import 'package:homework12/model/contact_model.dart';
import 'package:homework12/model/message_model.dart';

class FirebaseService {
  final CollectionReference message =
      FirebaseFirestore.instance.collection('messages');
  final CollectionReference contacts=
      FirebaseFirestore.instance.collection("contacts");

  Stream<List<MessageModel>> getMessages() {
    return message.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> msg = doc.data() as Map<String, dynamic>;
        return MessageModel(
          userId: doc.id,
          who: msg['who'] as String? ?? "",
          createdTime: msg['createdTime'],
          messageText: msg['messageText'],
          messageId: msg['messageId'],
          isFile: msg['isFile'],
          contactId: msg['contactId'],
          status: msg['status'],
        );
      }).toList();
    });
  }

  Stream<List<ContactModel>> getContact() {
    return contacts.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> cont = doc.data() as Map<String, dynamic>;
        return ContactModel(
          userId: doc.id,
          contactId:cont['contactId'] as int? ?? 0 ,
          contactLasName: cont['contactLasName'] as String? ?? "" ,
          contactName: cont['contactName'] as String? ?? "",
        );
      }).toList();
    });
  }

  Future<void> addMessage(MessageModel messageModel) {
    return message.add(messageModel.toJson());
  }

  Future<void> addContact(ContactModel contactModel) {
    return contacts.add(contactModel.toJson());
  }

}
