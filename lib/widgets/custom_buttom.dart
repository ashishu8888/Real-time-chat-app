import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CustomButtom({Key? key, required this.text, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        primary: tabColor,
        minimumSize: const Size(
          double.infinity,
          50,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
