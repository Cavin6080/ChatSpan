import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contacts_nav_controller.dart';

class ContactsNavView extends GetView<ContactsNavController> {
  const ContactsNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('ContactsNavView'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Text(
          'ContactsNavView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
