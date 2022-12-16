import 'dart:async';

import 'package:get/get.dart';
import 'package:star_menu/star_menu.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ChatScreenController extends GetxController {
  late final Channel channel;
  late StreamSubscription<int> unreadCountSubscription;

  @override
  void onInit() {
    if (Get.arguments != null) {
      channel = Get.arguments;
    }

    super.onInit();
  }

  Future<void> _unreadCountHandler(int count) async {
    if (count > 0) {
      await channel.markRead();
    }
  }

  @override
  void onReady() {
    // _unreadCountHandler(count)

    unreadCountSubscription =
        channel.state!.unreadCountStream.listen((_unreadCountHandler));
    super.onReady();
  }
}
