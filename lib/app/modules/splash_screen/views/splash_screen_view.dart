import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SplashScreenController>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder<void>(
              future: logic.handleAuthenticatedState(context),
              builder: (context, snapshot) {
                return Center(
                  child: Text(
                    'Splash Screen',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
