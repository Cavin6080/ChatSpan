import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
  final void Function()? onTap;
  final double? size;
  const ProfileImage({
    this.onTap,
    this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? image = context.currentUserImage;
    return image != null
        ? GestureDetector(
            onTap: onTap ?? () => Get.toNamed(Routes.PROFILE),
            child: CircleAvatar(
              radius: size ?? 20,
              backgroundImage:
                  CachedNetworkImageProvider(context.currentUserImage!),
            ),
          )
        : const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blue,
          );
  }
}
