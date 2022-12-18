import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
        child: Lottie.asset("assets/lottie/coming_soon_1.json"),
      ),
    );
  }
}
