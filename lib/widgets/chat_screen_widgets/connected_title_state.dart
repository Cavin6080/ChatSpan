import 'package:chat_app/widgets/chat_screen_widgets/typing_indicator.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

Widget buildConnectedTitleState(
  BuildContext context,
  List<Member>? members,
) {
  Widget? alternativeWidget;
  final channel = StreamChannel.of(context).channel;
  final memberCount = channel.memberCount;
  if (memberCount != null && memberCount > 2) {
    var text = 'Members: $memberCount';
    final watcherCount = channel.state?.watcherCount ?? 0;
    if (watcherCount > 0) {
      text = 'watchers $watcherCount';
    }
    alternativeWidget = Text(
      text,
    );
  } else {
    final userId = StreamChatCore.of(context).currentUser?.id;
    final otherMember = members?.firstWhere(
      (element) => element.userId != userId,
    );

    if (otherMember != null) {
      if (otherMember.user?.online == true) {
        alternativeWidget = const Text(
          'Online',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        );
      } else {
        alternativeWidget = Text(
          'Last online: '
          '${Jiffy(otherMember.user?.lastActive).fromNow()}',
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        );
      }
    }
  }
  return TypingIndicator(
    alternativeWidget: alternativeWidget,
  );
}
