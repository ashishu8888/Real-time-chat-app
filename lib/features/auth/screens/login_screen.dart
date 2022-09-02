// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/constants/colors.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/widgets/custom_buttom.dart';
import 'package:country_picker/country_picker.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  bool isLoad = false;
  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      );
    },
  );
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  void sendPhoneNumber() {
    String phoneNum = phoneController.text.trim();

    if (country != null && phoneNum.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+$country$phoneNum');
    } else {
      ShowSnackBar(context: context, content: 'Please Fill in details');
      setState(() {
        isLoad = false;
      });
    }
  }

  String country = '91';
  void countryPicker() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        countryListTheme: const CountryListThemeData(
          flagSize: 25,
          backgroundColor: backgroundColor,
          textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
          bottomSheetHeight: 500,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: tabColor,
              ),
            ),
          ),
        ),
        onSelect: (Country country) {
          setState(() {
            this.country = country.phoneCode;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Enter your phone number'),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Whatsapp will need to verify your phone number.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: countryPicker,
                child: const Text('Pick country'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '+$country',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: const InputDecoration(
                        hintText: 'phone number',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.5,
              ),
              SizedBox(
                width: 90,
                child: !isLoad
                    ? CustomButtom(
                        onpressed: () {
                          setState(() {
                            isLoad = true;
                          });
                          sendPhoneNumber();
                        },
                        text: 'NEXT',
                      )
                    : spinkit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
