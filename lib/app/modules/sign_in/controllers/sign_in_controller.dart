import 'package:chat_app/widgets/form_validations.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class SignInController extends GetxController {
  final FormValidations? formValidations;
  SignInController({this.formValidations});
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  final _obscureText = true.obs;
  set obscureText(value) => _obscureText.value = value;
  get obscureText => _obscureText.value;

  // Toggles the password show status
  void toggle() {
    print("toggle $obscureText");
    obscureText = !obscureText;
  }

  final registerFormKey = GlobalKey<FormState>();
  final auth = firebase.FirebaseAuth.instance;
  final functions = FirebaseFunctions.instanceFor(region: "asia-south1");

  ////text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    var streamclient = StreamChatCore.of(context).client;

    if (registerFormKey.currentState!.validate()) {
      isLoading = true;
      try {
        // Authenticate with Firebase
        final creds =
            await firebase.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        final user = creds.user;

        if (user == null) {
          getSnackBar("User is empty", SNACK.FAILED);
          return;
        }

        // Get Stream user token from Firebase Functions
        final results = await functions
            .httpsCallable('ext-auth-chat-getStreamUserToken')
            .call();

        // Connnect stream user
        // streamclient.disconnectUser();
        await streamclient.connectUser(
          User(id: creds.user!.uid),
          results.data,
        );
        isLoading = false;
        Get.offAndToNamed(Routes.NAVIGATION);
      } on firebase.FirebaseAuthException catch (e) {
        isLoading = false;
        getSnackBar(e.message.toString(), SNACK.FAILED);
      } on FirebaseFunctionsException catch (e) {
        isLoading = false;
        log(e.code);
        log(e.message.toString());
        log(e.details);
        getSnackBar("Erorr retriving stream chat token", SNACK.FAILED);
      } catch (e, st) {
        log('Sign in error, $e');

        getSnackBar("An error occured", SNACK.FAILED);
      }
    }
  }
}
