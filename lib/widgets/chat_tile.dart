import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatTile extends StatelessWidget {
  final String userName;
  final String? photoUrl;
  final Widget lastmessage;
  final Widget unreadCount;
  final Channel? channel;
  const ChatTile({
    super.key,
    required this.userName,
    this.photoUrl,
    required this.lastmessage,
    required this.unreadCount,
    this.channel,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: Constant.avtarRadius,
        backgroundImage: photoUrl != null
            ? photoUrl!.isNotEmpty
                ? CachedNetworkImageProvider(photoUrl!)
                : null
            : null,
      ),
      title: Text(
        userName,
        style: Theme.of(context).textTheme.bodyMedium,
        overflow: TextOverflow.fade,
      ),
      subtitle: lastmessage,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          unreadCount,
          channel != null
              ? BuildLastTime(
                  channel: channel!,
                )
              : const SizedBox.shrink()
        ],
      ),
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

class BuildLastTime extends StatelessWidget {
  final Channel channel;
  const BuildLastTime({
    Key? key,
    required this.channel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BetterStreamBuilder<DateTime>(
      stream: channel.lastMessageAtStream,
      initialData: channel.lastMessageAt,
      builder: (context, data) {
        final lastMessageAt = data.toLocal();
        String stringDate;
        final now = DateTime.now();

        final startOfDay = DateTime(now.year, now.month, now.day);

        if (lastMessageAt.millisecondsSinceEpoch >=
            startOfDay.millisecondsSinceEpoch) {
          stringDate = Jiffy(lastMessageAt.toLocal()).jm;
        } else if (lastMessageAt.millisecondsSinceEpoch >=
            startOfDay
                .subtract(const Duration(days: 1))
                .millisecondsSinceEpoch) {
          stringDate = 'YESTERDAY';
        } else if (startOfDay.difference(lastMessageAt).inDays < 7) {
          stringDate = Jiffy(lastMessageAt.toLocal()).EEEE;
        } else {
          stringDate = Jiffy(lastMessageAt.toLocal()).yMd;
        }
        return Text(
          stringDate,
          style: TextStyle(
            fontSize: 11,
            letterSpacing: -0.2,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
          ),
        );
      },
    );
  }
}
