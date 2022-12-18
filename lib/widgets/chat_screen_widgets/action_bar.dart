import 'package:chat_app/animation/scale_animation.dart';
import 'package:chat_app/app/modules/chatScreen/controllers/chat_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ActionBar extends StatefulWidget {
  const ActionBar({Key? key}) : super(key: key);

  @override
  _ActionBarState createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  late final TextEditingController controller;
  late ChatScreenController chatScreenController;

  Future<void> _sendMessage() async {
    if (controller.text.isNotEmpty) {
      StreamChannel.of(context)
          .channel
          .sendMessage(Message(text: controller.text));
      controller.clear();
      // FocusScope.of(context).unfocus();
      await StreamChannel.of(context).channel.markRead();
    }
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    chatScreenController = Get.find<ChatScreenController>();
    controller = chatScreenController.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 6,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: SafeArea(
        bottom: true,
        top: false,
        child: Row(
          children: [
            CustomAnimatedScale(
              onTap: () {
                chatScreenController.showEmoji.value =
                    !chatScreenController.showEmoji.value;
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      width: 2,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    Icons.emoji_emotions_outlined,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: TextField(
                  controller: controller,
                  onChanged: (val) {
                    StreamChannel.of(context).channel.keyStroke();
                  },
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    hintText: 'Type something...',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (_) => _sendMessage(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12.0,
              ),
              child: IconButton(
                onPressed: _sendMessage,
                icon: const Icon(
                  Icons.send,
                  color: Color(0xFF491CCB),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
