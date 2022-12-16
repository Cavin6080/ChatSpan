import 'package:chat_app/app/modules/select_user/model/user_model.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class SelectUserController extends GetxController {
  Future<void> onSubmit(BuildContext context, UserModel user) async {
    try {
      final client = StreamChatCore.of(context).client;
      await client.connectUser(
        User(id: user.id, extraData: {
          "name": user.name,
          "image": user.photoURL,
        }),
        Constant.STREAM_KEY,
      );
    } catch (e) {}
  }
}
