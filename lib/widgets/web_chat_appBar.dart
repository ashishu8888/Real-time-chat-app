import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors.dart';
import 'package:whatsapp_clone/constants/info.dart';

class WebChatAppBAr extends StatelessWidget {
  const WebChatAppBAr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: webAppBarColor,
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?auto=compress%2Cformat&ixlib=php-3.3.0',
                ),
                radius: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              Text(
                info[0]['name'].toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          Row(
            children: const [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
