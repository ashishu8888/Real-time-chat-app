import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors.dart';

class bottomChatField extends StatefulWidget {
  bottomChatField({
    Key? key,
    required this.chatController,
  }) : super(key: key);

  final TextEditingController chatController;

  @override
  State<bottomChatField> createState() => _bottomChatFieldState();
}

class _bottomChatFieldState extends State<bottomChatField> {
  bool isShowSend = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: widget.chatController,
            onChanged: (val) {
              // print('checking');
              if (val.isNotEmpty) {
                setState(() {
                  isShowSend = true;
                });
              } else {
                setState(() {
                  isShowSend = false;
                });
              }
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: mobileChatBoxColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    //padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.gif,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                suffixIcon: SizedBox(
                  // padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.attach_file,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                hintText: 'type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.all(10)),
          ),
        ),
        CircleAvatar(
          backgroundColor: const Color(0xFF128C7E),
          child: IconButton(
            onPressed: null,
            icon: isShowSend
                ? const Icon(
                    Icons.send,
                  )
                : const Icon(
                    Icons.mic,
                    color: Colors.white,
                  ),
          ),
        )
      ],
    );
  }
}
