import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/app/modules/chatScreen/custom_painter/chat_bubble_painter.dart';
import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: BubbleBackground(
              colors: [
                message.user?.id != context.currentUser?.id
                    // ? const Color(0xFF6C7689)
                    ? const Color(0xFF19B7FF)
                    : const Color(0xFF19B7FF),
                message.user?.id != context.currentUser?.id
                    // ? const Color(0xFF3A364B)
                    ? Color.fromARGB(255, 9, 159, 228)
                    : const Color(0xFF491CCB),
                // : const Color(0xFF491CCB),
                //  Color.fromRGBO(143, 148, 251, 1),
                // Color.fromRGBO(143, 148, 251, .6),
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
