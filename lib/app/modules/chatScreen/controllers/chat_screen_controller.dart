import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_menu/star_menu.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ChatScreenController extends GetxController {
  late final Channel channel;
  late StreamSubscription<int> unreadCountSubscription;
  final TextEditingController controller = TextEditingController();

  Rx<bool> showEmoji = false.obs;

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

  customdate(dateTime) {
    final createdAt = Jiffy(dateTime);
    final now = Jiffy(DateTime.now());

    var dayInfo = createdAt.MMMd;
    if (createdAt.isSame(now, Units.DAY)) {
      dayInfo = "Today";
    } else if (createdAt.isSame(now.subtract(days: 1), Units.DAY)) {
      dayInfo = "Yesterday";
    } else if (createdAt.isAfter(now.subtract(days: 7), Units.DAY)) {
      dayInfo = createdAt.EEEE;
    } else if (createdAt.isAfter(now.subtract(years: 1), Units.DAY)) {
      dayInfo = createdAt.MMMd;
    }
    return dayInfo;
    //  dayInfo = dayInfo.toUpperCase();
  }
}
