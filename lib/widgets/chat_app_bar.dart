import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/widgets/chat_screen_widgets/connected_title_state.dart';
import 'package:chat_app/widgets/chat_screen_widgets/connection_status_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class ChatScreenApBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String? photoUrl;
  const ChatScreenApBar({
    Key? key,
    required this.userName,
    this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final channel = StreamChannel.of(context).channel;
    return AppBar(
      iconTheme: Theme.of(context).iconTheme,
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      leading: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage:
                photoUrl != null ? CachedNetworkImageProvider(photoUrl!) : null,
          ),
          10.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.fade,
                maxLines: 1,
              ),
              BetterStreamBuilder<List<Member>>(
                stream: channel.state!.membersStream,
                initialData: channel.state!.members,
                builder: (context, data) => ConnectionStatusBuilder(
                  statusBuilder: (context, status) {
                    switch (status) {
                      case ConnectionStatus.connected:
                        return buildConnectedTitleState(context, data);
                      case ConnectionStatus.connecting:
                        return const Text(
                          'Connecting',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        );
                      case ConnectionStatus.disconnected:
                        return const Text(
                          'Offline',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //     child: Center(
      //       child: IconButton(
      //         onPressed: () => Get.back(),
      //         icon: const Icon(
      //           CupertinoIcons.video_camera_solid,
      //         ),
      //       ),
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.only(right: 20),
      //     child: Center(
      //       child: IconButton(
      //         onPressed: () => Get.back(),
      //         icon: const Icon(
      //           CupertinoIcons.phone_solid,
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
