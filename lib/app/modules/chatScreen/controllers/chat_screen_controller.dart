import 'dart:async';

import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ChatScreenController extends GetxController {
  late final Channel channel;
  late StreamSubscription<int> unreadCountSubscription;

  @override
  void onInit() {
    if (Get.arguments != null) {
      channel = Get.arguments;
    }
    unreadCountSubscription = StreamChannel.of(Get.context!)
        .channel
        .state!
        .unreadCountStream
        .listen((_unreadCountHandler));
    super.onInit();
  }

  Future<void> _unreadCountHandler(int count) async {
    if (count > 0) {
      await StreamChannel.of(Get.context!).channel.markRead();
    }
  }
}
