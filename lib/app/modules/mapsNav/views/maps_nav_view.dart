import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maps_nav_controller.dart';

class MapsNavView extends GetView<MapsNavController> {
  const MapsNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('MapsNavView'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Text(
          'MapsNavView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
