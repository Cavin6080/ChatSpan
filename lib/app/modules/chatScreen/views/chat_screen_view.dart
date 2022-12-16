import 'dart:developer' as dev;

import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/app/modules/chatScreen/custom_painter/chat_bubble_painter.dart';
import 'package:chat_app/app/modules/chatScreen/views/message_bubble.dart';
import 'package:chat_app/widgets/chat_app_bar.dart';
import 'package:chat_app/widgets/chat_screen_widgets/action_bar.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:star_menu/star_menu.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../controllers/chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final data = MessageGenerator.generate(60, 1337);
    return StreamChannel(
      channel: controller.channel,
      child: Scaffold(
        appBar: ChatScreenApBar(
          photoUrl: getChannelImage(controller.channel, context.currentUser!),
          userName: getChannelName(
            controller.channel,
            context.currentUser!,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: MessageListCore(
                emptyBuilder: (context) =>
                    const Center(child: Text("Start Messeging")),
                errorBuilder: (BuildContext context, Object error) =>
                    const Center(child: Text("Error")),
                loadingBuilder: (BuildContext context) =>
                    Center(child: loadingIndicator),
                messageListBuilder: (ctx, messages) {
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index < messages.length) {
                        final message = messages[index];

                        return AnimationConfiguration.staggeredList(
                          duration: const Duration(milliseconds: 375),
                          position: index,
                          child: GestureDetector(
                            onLongPress: () {
                              // Get.bottomSheet(ListView());
                              // Get.dialog(Container());
                              // StarMenuController().openMenu!();
                              // StarMenu(
                              //   params: StarMenuParameters(),
                              //   controller: StarMenuController(),
                              //   items: [
                              //     Container(
                              //       height: 20,
                              //       color: Colors.black,
                              //     ),
                              //     Container(
                              //       height: 20,
                              //       color: Colors.green,
                              //     ),
                              //     Container(
                              //       height: 20,
                              //       color: Colors.red,
                              //     ),
                              //     Container(
                              //       height: 20,
                              //       color: Colors.amber,
                              //     ),
                              //   ],
                              //   child: Container(
                              //     height: 30,
                              //     color: Colors.blueGrey,
                              //   ),
                              // );
                            },
                            child: MessageBubble(
                              message: message,
                              child: Text(message.text ?? ""),
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  );
                },
              ),
            ),
            ActionBar(),
          ],
        ),
      ),
    );
  }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final logic = Get.find<ChatScreenController>();
//     return ;
//   }
// }
