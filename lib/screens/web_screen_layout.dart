import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors.dart';
import 'package:whatsapp_clone/widgets/chat_list.dart';
import 'package:whatsapp_clone/widgets/contact_widget.dart';
import 'package:whatsapp_clone/widgets/web_chat_appBar.dart';
import 'package:whatsapp_clone/widgets/web_profile_bar.dart';
import 'package:whatsapp_clone/widgets/web_search_bar.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  WebProfileBar(),
                  WebSearchBar(),
                  ContactList(),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.70,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgroundImage.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                //webchat app bar
                const WebChatAppBAr(),
                const Expanded(
                  child: ChatList(),
                ),
                //message input bar
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  color: chatBarMessage,
                  child: Row(
                    children: [
                      const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.emoji_emotions_outlined),
                      ),
                      const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.attach_file_outlined),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: searchBarColor,
                              hintStyle: const TextStyle(
                                fontSize: 14,
                              ),
                              hintText: 'Type a message',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      const IconButton(onPressed: null, icon: Icon(Icons.mic))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
