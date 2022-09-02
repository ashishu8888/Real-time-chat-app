import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';
import 'package:whatsapp_clone/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_clone/features/select%20contact/screens/select_contact_screen.dart';
import 'package:whatsapp_clone/screens/user_information_screen.dart';
import 'package:whatsapp_clone/screens/error.dart';
import 'package:whatsapp_clone/features/chat/screens/mobile_chat_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationID = settings.arguments as String;
      return MaterialPageRoute(
        builder: (ctx) => OTPScreen(
          verificationID: verificationID,
        ),
      );
    case UserInfoScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const UserInfoScreen(),
      );
    case SelectContactScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const SelectContactScreen(),
      );
    case MobileChatScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final name = arguments['name'];
      final uid = arguments['uid'];

      return MaterialPageRoute(
        builder: (ctx) => MobileChatScreen(
          name: name,
          uid: uid,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (ctx) => const Scaffold(
          body: ErrorScreen(
            error: 'This page doesn\'t exist',
          ),
        ),
      );
  }
}
