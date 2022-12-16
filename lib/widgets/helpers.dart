import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

enum SNACK { SUCCESS, FAILED }

getSnackBar(String message, SNACK type, {String? title}) {
  return Get.snackbar(title ?? '', '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type == SNACK.SUCCESS ? Colors.green : Colors.red,
      snackStyle: SnackStyle.GROUNDED,
      colorText: Colors.white,
      titleText: Container(
        height: 0,
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      margin: const EdgeInsets.all(0));
}

final loadingIndicator = LoadingAnimationWidget.fourRotatingDots(
  color: Colors.blue,
  size: 60,
);
