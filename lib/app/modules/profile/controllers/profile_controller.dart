import 'dart:developer';

import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class ProfileController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;
  final _isParticle = false.obs;
  get isParticle => _isParticle.value;
  set isParticle(value) => _isParticle.value = value;

  logout(BuildContext context) async {
    try {
      isLoading = true;
      await StreamChatCore.of(context).client.disconnectUser();
      await firebase.FirebaseAuth.instance.signOut();

      isLoading = false;
      Get.offAllNamed(Routes.SIGN_IN);
    } catch (e) {
      log(e.toString());
      getSnackBar(
        "Something went wrong, please try again",
        SNACK.FAILED,
      );
    }
  }
}
