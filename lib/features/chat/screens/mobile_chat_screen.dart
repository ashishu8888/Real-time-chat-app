import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/constants/colors.dart';
import 'package:whatsapp_clone/constants/info.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/chat/widgets/bottom_chat_field.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/widgets/chat_list.dart';
import 'package:whatsapp_clone/widgets/loader.dart';

class MobileChatScreen extends ConsumerWidget {
  TextEditingController chatController = TextEditingController();
  static const routeName = '/mobile-chat-screen';
  final String name;
  final String uid;
  MobileChatScreen({Key? key, required this.name, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: appBarColor,
        title: StreamBuilder<UserModel>(
          stream: ref.read(authControllerProvider).userDataById(uid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                  ),
                  Text(
                    snapshot.data!.isOnline ? 'online' : 'Last seen recently',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.normal),
                  ),
                ],
              );
            }
            return const Loader();
          },
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          bottomChatField(chatController: chatController),
        ],
      ),
    );
  }
}
