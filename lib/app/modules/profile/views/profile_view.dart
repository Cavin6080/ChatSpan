import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:chat_app/widgets/profile_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        progressIndicator: loadingIndicator,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              30.ph,
              const Center(
                child: ProfileImage(size: 40),
              ),
              Text(context.currentUser?.name ?? ""),
              TextButton(
                onPressed: () => controller.logout(context),
                child: const Text("LogOut"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
