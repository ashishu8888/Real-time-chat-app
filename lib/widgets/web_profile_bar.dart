import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors.dart';

class WebProfileBar extends StatelessWidget {
  const WebProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width: MediaQuery.of(context).size.width * 0.3,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: dividerColor),
        ),
        color: webAppBarColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?auto=compress%2Cformat&ixlib=php-3.3.0'),
          ),
          Row(
            children: const [
              IconButton(
                onPressed: null,
                icon: Icon(Icons.comment),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.more_vert),
              ),
            ],
          )
          //Icon
        ],
      ),
    );
  }
}
