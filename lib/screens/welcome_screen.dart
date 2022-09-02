import 'package:flutter/material.dart';
import 'package:whatsapp_clone/constants/colors.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';
import 'package:whatsapp_clone/widgets/custom_buttom.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Welcome to Whatsapp',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size / 10,
            ),
            Image.asset(
              'assets/bg.png',
              color: tabColor,
              height: 280,
              width: 280,
            ),
            SizedBox(
              height: size / 10,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "read our privacy policy. Tap 'Agree and continue' to accept the Terms of Service.",
                style: TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size * 0.45,
              child: CustomButtom(
                text: 'agree and continue',
                onpressed: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
