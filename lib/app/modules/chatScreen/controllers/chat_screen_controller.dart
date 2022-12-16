import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ChatScreenController extends GetxController {
  late final Channel channel;
  @override
  void onInit() {
    if (Get.arguments != null) {
      channel = Get.arguments;
    }
    super.onInit();
  }
}
