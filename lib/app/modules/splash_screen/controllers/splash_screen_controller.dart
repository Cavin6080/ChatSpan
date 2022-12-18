import 'dart:async';

// import 'package:firebase_core/firebase_core.dart' as firebase;
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class SplashScreenController extends GetxController {
  late final StreamSubscription<firebase.User?> listener;
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> handleAuthenticatedState(BuildContext context) async {
    final client = StreamChatCore.of(context).client;

    final auth = firebase.FirebaseAuth.instance;
    listener = auth.authStateChanges().listen(
      (user) async {
        if (user != null) {
          // get Stream user token
          final callable = FirebaseFunctions.instanceFor(region: "asia-south1")
              .httpsCallable('ext-auth-chat-getStreamUserToken');
          final results = await Future.wait([
            callable(),
            // delay to show loading indicator
            Future.delayed(const Duration(milliseconds: 700)),
          ]);
          // connect Stream user
          await client.connectUser(
            User(id: user.uid),
            results[0]!.data,
          );
          //authenticated
          Get.offAndToNamed(Routes.NAVIGATION);
        } else {
          //go to signin
          Get.offAndToNamed(Routes.SIGN_IN);
        }
      },
    );
  }

  @override
  void onReady() {
    // handleAuthenticatedState();
    super.onReady();
  }

  @override
  void onClose() {
    listener.cancel();
    super.onClose();
  }
}
