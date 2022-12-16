import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/status_nav_controller.dart';

class StatusNavView extends GetView<StatusNavController> {
  const StatusNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatusNavView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StatusNavView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
