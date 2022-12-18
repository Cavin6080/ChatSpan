import 'dart:developer';

import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ChatNavController extends GetxController {
  late StreamChannelListController streamChannelListController;
  // StreamChannelListController();

  final _isLoading = false.obs;
  get isLoading => this._isLoading.value;
  set isLoading(value) => this._isLoading.value = value;

  @override
  void onInit() {
    log("message init chat navigation");
    streamChannelListController = StreamChannelListController(
      client: StreamChatCore.of(Get.context!).client,
      filter: Filter.and(
        [
          Filter.equal('type', 'messaging'),
          Filter.in_(
            'members',
            [
              StreamChatCore.of(Get.context!).currentUser!.id,
            ],
          ),
        ],
      ),
    );
    streamChannelListController.doInitialLoad();

    super.onInit();
  }

  Future<void> unreadCountHandler(int count) async {
    if (count > 0) {
      await StreamChannel.of(Get.context!).channel.markRead();
    }
  }
}
