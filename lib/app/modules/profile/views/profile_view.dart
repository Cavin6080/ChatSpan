import 'package:chat_app/animation/scale_animation.dart';
import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:chat_app/widgets/profile_image.dart';
import 'package:fade_out_particle/fade_out_particle.dart';
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
              const Hero(
                tag: "profile",
                child: Center(
                  child: ProfileImage(size: 40),
                ),
              ),
              20.ph,
              Center(
                child: Text(
                  context.currentUser?.name ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              20.ph,
              CustomAnimatedScale(
                onTap: () async {
                  controller.isParticle = true;
                  await Future.delayed(Duration(seconds: 2)).then(
                    (value) => controller.logout(context),
                  );
                  // controller.logout(context);
                },
                child: Obx(
                  () => FadeOutParticle(
                    disappear: controller.isParticle,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 60),
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF491CCB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Logout",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // TextButton(
              //   onPressed: () => controller.logout(context),
              //   child: const Text("LogOut"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
