import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/route_manager.dart';

class ChatTile extends StatelessWidget {
  final String userName;
  final String lastmessage;
  final String unreadCount;
  const ChatTile({
    super.key,
    required this.userName,
    required this.lastmessage,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: Constant.avtarRadius,
      ),
      title: Text(
        userName,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        lastmessage,
        style: Theme.of(context).textTheme.bodySmall,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: BadgeIndicator(count: unreadCount),
    );
  }
}

class BadgeIndicator extends StatelessWidget {
  final String count;
  const BadgeIndicator({
    Key? key,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              count,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
