import 'dart:developer';

import 'package:chat_app/app/modules/select_user/model/user_model.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class SelectUserController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  Future<void> onSubmit(BuildContext context, UserModel user) async {
    try {
      final client = StreamChatCore.of(context).client;
      isLoading = true;
      await client.connectUser(
        User(id: user.id, extraData: {
          "name": user.name,
          "image": user.photoURL,
        }),
        client.devToken(Constant.STREAM_KEY).rawValue,
      );
      isLoading = false;
      Get.toNamed(Routes.NAVIGATION);
      getSnackBar(
        "Signed in scuccessfully",
        SNACK.SUCCESS,
      );
    } catch (e, st) {
      isLoading = false;
      getSnackBar(
        "Something went wrong, please try again later",
        SNACK.FAILED,
      );
      log("Something went wrong, ${e.toString()}");
      log(st.toString());
    }
  }
}
