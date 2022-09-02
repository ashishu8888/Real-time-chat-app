import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/models/user_model.dart';

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepository({
    required this.firestore,
    required this.auth,
  });
  void _saveDataToUserSubCollection(
    UserModel senderUserData,
    UserModel receiverUserModel,
    String text,
    DateTime timeSent,
    String receiverUserId,
  ) async {
    
  }

  void sendTextMessage({
    required BuildContext context,
    required String text,
    required String recieverUserId,
    required UserModel senderUser,
  }) async {
    try {
      var timeSpent = DateTime.now();
      UserModel receiverUserData;
      var userDataMap =
          await firestore.collection('users').doc(recieverUserId).get();
      receiverUserData = UserModel.fromMap(userDataMap.data()!);
    } catch (e) {
      ShowSnackBar(context: context, content: e.toString());
    }
  }
}
