import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // MediaQuery(data: data, child: child)
          20.ph,
          Obx(() => Text(controller.count.toString())),
          20.ph,
          Center(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => controller.increment(),
            ),
          ),
        ],
      ),
    );
  }
}
