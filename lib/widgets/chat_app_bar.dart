import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreenApBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String photoUrl;
  const ChatScreenApBar({
    Key? key,
    required this.userName,
    required this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 50,
      leading: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      title: Row(
        children: [
          const CircleAvatar(
            radius: 18,
          ),
          10.pw,
          Text(
            userName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                CupertinoIcons.video_camera_solid,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Center(
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                CupertinoIcons.phone_solid,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
