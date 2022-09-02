import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/info.dart';
import 'package:whatsapp_clone/features/chat/screens/mobile_chat_screen.dart';

class ContactList extends StatelessWidget {
  const ContactList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: info.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return MobileChatScreen(
                            name: 'name',
                            uid: 'uid',
                          );
                        }),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          info[index]['profilePic'].toString(),
                        ),
                        radius: 40,
                      ),
                      title: Text(
                        info[index]['name'].toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      subtitle: Text(
                        info[index]['message'].toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      trailing: Text(
                        info[index]['time'].toString(),
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const Divider()
              ],
            );
          }),
    );
  }
}
