import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/call_nav_controller.dart';

class CallNavView extends GetView<CallNavController> {
  const CallNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CallNavView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CallNavView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
