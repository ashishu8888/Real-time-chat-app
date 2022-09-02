import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/features/select%20contact/controller/select_contact_controller.dart';
import 'package:whatsapp_clone/screens/error.dart';
import 'package:whatsapp_clone/widgets/loader.dart';

class SelectContactScreen extends ConsumerWidget {
  static const String routeName = '/select-contact';
  const SelectContactScreen({Key? key}) : super(key: key);
  void selectContact(
      WidgetRef ref, Contact selectedContact, BuildContext context) {
    ref
        .read(selectContactControllerProvider)
        .selectContact(selectedContact, context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('select contact'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: ref.watch(getContactControllerProvider).when(
        data: (contactList) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    selectContact(ref, contactList[index], context);
                  },
                  child: ListTile(
                    leading: contactList[index].photo == null
                        ? null
                        : CircleAvatar(
                            backgroundImage:
                                MemoryImage(contactList[index].photo!),
                            radius: 30,
                          ),
                    title: Text(contactList[index].displayName),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stactTrace) {
          return ErrorScreen(
            error: error.toString(),
          );
        },
        loading: () {
          return const Loader();
        },
      ),
    );
  }
}
