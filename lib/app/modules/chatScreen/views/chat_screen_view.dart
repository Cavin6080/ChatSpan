import 'dart:developer' as dev;

import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/app/modules/chatScreen/custom_painter/chat_bubble_painter.dart';
import 'package:chat_app/widgets/chat_app_bar.dart';
import 'package:chat_app/widgets/chat_screen_widgets/action_bar.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../controllers/chat_screen_controller.dart';

import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
// import '../app.dart';

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
                    const Center(child: Text("No meesage")),
                errorBuilder: (BuildContext context, Object error) =>
                    const Center(child: Text("Error")),
                loadingBuilder: (BuildContext context) =>
                    Center(child: loadingIndicator),
                messageListBuilder: (ctx, messages) {
                  // return SizedBox();
                  return ListView.builder(
                    reverse: true,
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      // dev.log("range: $index");
                      // dev.log("messageasdsa: ${messages[index]}}");
                      if (index < messages.length) {
                        final message = messages[index];

                        return MessageBubble(
                          message: message,
                          child: Text(message.text ?? ""),
                        );
                      }
                      return SizedBox();
                    },
                  );
                },
              ),
              // child: ListView.builder(
              //   padding: const EdgeInsets.symmetric(vertical: 16.0),
              //   reverse: true,
              //   itemCount: data.length,
              //   itemBuilder: (context, index) {
              //     final message = data[index];
              //     return MessageBubble(
              //       message: message,
              //       child: Text(message.text),
              //     );
              //   },
              // ),
            ),
            ActionBar(),
          ],
        ),
      ),
    );
  }
}

@immutable
class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    required this.child,
    super.key,
  });

  final Message message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final messageAlignment = message.user?.id != context.currentUser?.id
        ? Alignment.topLeft
        : Alignment.topRight;

    return FractionallySizedBox(
      alignment: messageAlignment,
      widthFactor: 0.8,
      child: Align(
        alignment: messageAlignment,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: BubbleBackground(
              colors: [
                message.user?.id != context.currentUser?.id
                    ? const Color(0xFF6C7689)
                    : const Color(0xFF19B7FF),
                message.user?.id != context.currentUser?.id
                    ? const Color(0xFF3A364B)
                    : const Color(0xFF491CCB),
              ],
              child: DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class BubbleBackground extends StatelessWidget {
  const BubbleBackground({
    super.key,
    required this.colors,
    this.child,
  });

  final List<Color> colors;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BubblePainter(
        scrollable: Scrollable.of(context)!,
        bubbleContext: context,
        colors: colors,
      ),
      child: child,
    );
  }
}
