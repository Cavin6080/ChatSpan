import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

enum SNACK { SUCCESS, FAILED }

getSnackBar(String message, SNACK type, {String? title}) {
  return Get.snackbar(title ?? '', '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type == SNACK.SUCCESS ? Colors.green : Colors.red,
      snackStyle: SnackStyle.GROUNDED,
      colorText: Colors.white,
      titleText: Container(
        height: 0,
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      margin: const EdgeInsets.all(0));
}

final loadingIndicator = LoadingAnimationWidget.fourRotatingDots(
  color: const Color.fromRGBO(143, 148, 251, .6),
  size: 60,
);

String getChannelName(Channel channel, User currentUser) {
  if (channel.name != null) {
    return channel.name!;
  } else if (channel.state?.members.isNotEmpty ?? false) {
    final otherMembers = channel.state?.members
        .where(
          (element) => element.userId != currentUser.id,
        )
        .toList();
    if (otherMembers?.length == 1) {
      return otherMembers!.first.user?.name ?? 'No name';
    } else {
      return 'Multiple users';
    }
  } else {
    return 'No Channel Name';
  }
}

String? getChannelImage(Channel channel, User currentUser) {
  if (channel.image != null) {
    return channel.image!;
  } else if (channel.state?.members.isNotEmpty ?? false) {
    final otherMembers = channel.state?.members
        .where(
          (element) => element.userId != currentUser.id,
        )
        .toList();
    if (otherMembers?.length == 1) {
      return otherMembers!.first.user?.image;
    }
  } else {
    return null;
  }
}
