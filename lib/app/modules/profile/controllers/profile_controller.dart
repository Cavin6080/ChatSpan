import 'dart:developer';

import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ProfileController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  logout(BuildContext context) async {
    try {
      isLoading = true;
      await StreamChatCore.of(context).client.disconnectUser();
      isLoading = false;
      Get.toNamed(Routes.SELECT_USER);
    } catch (e) {
      log(e.toString());
      getSnackBar(
        "Something went wrong, please try again",
        SNACK.FAILED,
      );
    }
  }
}
