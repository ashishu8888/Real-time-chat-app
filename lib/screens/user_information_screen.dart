import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/constants/colors.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/widgets/custom_buttom.dart';

class UserInfoScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information';
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends ConsumerState<UserInfoScreen> {
  bool isLoad = false;
  File? image;
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
  TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  void storeUserData() async {
    String name = nameController.text.trim();
    if (name.isNotEmpty) {
      ref.read(authControllerProvider).saveUserDataToFirebase(
            context,
            name,
            image,
          );
    } else {
      ShowSnackBar(context: context, content: 'Please fill details');
      setState(() {
        isLoad = false;
      });
    }
  }

  void OpenGallery() async {
    image = await openGallery();
    setState(() {
      Navigator.pop(context);
    });
  }

  void OpenCamera() async {
    image = await openCamera();
    setState(() {
      Navigator.pop(context);
    });
  }

  Future<void> _optionsDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: backgroundColor,
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                GestureDetector(
                  child: const Text(
                    'Open Camera',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  onTap: () {
                    setState(() {
                      OpenCamera();
                    });
                    Navigator.pop(context);
                  },
                ),
                const Padding(padding: EdgeInsets.all(10)),
                GestureDetector(
                    child: const Text(
                      'Open Gallery',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      OpenGallery();
                    })
              ],
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: image == null
                        ? const NetworkImage(
                            'https://i.pinimg.com/564x/2b/30/f8/2b30f89f7f7c3dbd38b1728fc452fb2a.jpg',
                          )
                        : Image.file(image!).image,
                  ),
                  Positioned(
                    left: 60,
                    bottom: 0,
                    child: IconButton(
                      onPressed: _optionsDialog,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: !isLoad
                    ? CustomButtom(
                        text: 'Done',
                        onpressed: () {
                          setState(() {
                            isLoad = true;
                            storeUserData();
                          });
                        },
                      )
                    : spinkit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
