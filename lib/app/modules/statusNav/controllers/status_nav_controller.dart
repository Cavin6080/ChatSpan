import 'dart:developer';

import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class StatusNavController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;

  // late StreamChannelListController streamChannelListController;
  late final StreamUserListController userListController;
  // StreamChannelListController();
  @override
  void onInit() {
    log("message init chat navigation");
    // streamChannelListController = StreamChannelListController(
    //   client: StreamChatCore.of(Get.context!).client,
    //   filter: Filter.notEqual('id', Get.context!.currentUser!.id),
    // );
    // streamChannelListController.doInitialLoad();
    userListController = StreamUserListController(
        client: StreamChatCore.of(Get.context!).client,
        // filter: Filter.in_(
        //   'members',
        //   [StreamChatCore.of(Get.context!).currentUser!.id],
        // ),

        filter: Filter.notEqual('id', Get.context!.currentUser!.id));
    userListController.doInitialLoad();

    super.onInit();
  }

  Future<void> createChannel(BuildContext context, User user) async {
    isLoading = true;
    final core = StreamChatCore.of(context);
    final channel = core.client.channel(
      'messaging',
      extraData: {
        'members': [
          core.currentUser!.id,
          user.id,
        ],
      },
    );
    await channel.watch();
    isLoading = false;
    Get.toNamed(Routes.CHAT_SCREEN, arguments: channel);
  }
}
