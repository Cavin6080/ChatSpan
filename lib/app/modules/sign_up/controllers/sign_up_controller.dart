import 'dart:developer';

import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/widgets/form_validations.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class SignUpController extends GetxController {
  final FormValidations? formValidations;
  SignUpController({this.formValidations});
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  final registerFormKey = GlobalKey<FormState>();
  final auth = firebase.FirebaseAuth.instance;
  final functions = FirebaseFunctions.instanceFor(region: "asia-south1");

  ////text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final imageController = TextEditingController();
  final usernameController = TextEditingController();

  final _obscureText = true.obs;
  set obscureText(value) => _obscureText.value = value;
  get obscureText => _obscureText.value;

  // Toggles the password show status
  void toggle() {
    print("toggle $obscureText");
    obscureText = !obscureText;
  }

  Future<void> signUp(BuildContext context) async {
    final client = StreamChatCore.of(context).client;

    if (registerFormKey.currentState!.validate()) {
      isLoading = true;
      try {
        // Authenticate with Firebase
        final creds =
            await firebase.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        final user = creds.user;
        if (user == null) {
          getSnackBar("User is empty", SNACK.FAILED);
          return;
        }
        // log("creds.user: ${creds.user?.displayName ?? ""}");
        // log("before future: ${usernameController.text}");
        // // Set Firebase display name and profile picture
        // List<Future<void>> futures = [
        //   creds.user!.updateDisplayName(usernameController.text),
        //   if (imageController.text.isNotEmpty)
        //     creds.user!.updatePhotoURL(imageController.text)
        // ];

        // await Future.wait(futures);
        // log("creds.user: ${creds.user?.displayName ?? ""}");
        await creds.user!.updateDisplayName(usernameController.text);
        await creds.user!.updatePhotoURL(imageController.text);

        // Create Stream user and get token using Firebase Functions
        final results = await functions
            .httpsCallable('ext-auth-chat-getStreamUserToken')
            .call();

        // Connect user to Stream and set user data
        final streamUser = User(
          id: creds.user!.uid,
          name: usernameController.text,
          image: imageController.text,
        );
        // await client.connectUser(
        //   streamUser,
        //   results.data,
        // );
        await client.updateUser(streamUser);
        isLoading = false;
        // Navigate to home screen
        Get.offAndToNamed(Routes.NAVIGATION);
      } on firebase.FirebaseAuthException catch (e) {
        isLoading = false;

        getSnackBar(e.message.toString(), SNACK.FAILED);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text(e.message ?? 'Auth error')),
        // );
      } catch (e, st) {
        log('Sign up error $e');
        debugPrint('Sign up error $e');
        log('trace----- $st');
        getSnackBar("An error occured", SNACK.FAILED);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('An error occured')),
        // );
      }
    }
  }
}
