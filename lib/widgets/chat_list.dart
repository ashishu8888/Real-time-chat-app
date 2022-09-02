import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:whatsapp_clone/constants/info.dart';
import 'package:whatsapp_clone/widgets/my_mssg_card.dart';
import 'package:whatsapp_clone/widgets/sender_mssg.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        if (messages[index]['isMe'] == true) {
          return MyMessageCard(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        } else {
          // other's message
          return SenderMessageCard(
              message: messages[index]['text'].toString(),
              date: messages[index]['time'].toString());
        }
      },
    );
  }
}
