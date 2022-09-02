import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/constants/colors.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';

class OTPScreen extends ConsumerStatefulWidget {
  static const String routeName = '/otp-screen';
  final String verificationID;
  const OTPScreen({Key? key, required this.verificationID}) : super(key: key);

  @override
  ConsumerState<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {
  TextEditingController otpcontroller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpcontroller.dispose();
  }

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref
        .read(authControllerProvider)
        .verifyOTP(context, widget.verificationID, userOTP);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verifying your number',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('we have sent an SMS with a code'),
            SizedBox(
              width: size.width * 0.5,
              child: TextField(
                textAlign: TextAlign.center,
                controller: otpcontroller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: '_ _ _ _ _ _',
                  hintStyle: TextStyle(fontSize: 40),
                ),
                onChanged: (val) {
                  if (val.length == 6) {
                    verifyOTP(ref, context, val.trim());
                  }
                },
                maxLength: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
