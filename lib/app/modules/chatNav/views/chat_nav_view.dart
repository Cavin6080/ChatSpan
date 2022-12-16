import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/widgets/chat_tile.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:chat_app/widgets/profile_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../controllers/chat_nav_controller.dart';

class ChatNavView extends StatelessWidget {
  final controller = Get.find<ChatNavController>();
  ChatNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Text(
          'Chat',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [const ProfileImage(), 10.pw],
      ),
      body: PagedValueListenableBuilder<int, Channel>(
        valueListenable: controller.streamChannelListController,
        builder: (context, value, child) {
          return value.when(
            (channels, nextPageKey, error) {
              log("channels.length: ${channels.length}");
              return LazyLoadScrollView(
                onEndOfPage: () async {
                  if (nextPageKey != null) {
                    controller.streamChannelListController
                        .loadMore(nextPageKey);
                  }
                },
                child: ListView.builder(
                  itemCount: (nextPageKey != null || error != null)
                      ? channels.length + 1
                      : channels.length,
                  itemBuilder: (BuildContext context, int index) {
                    // log("indexL : ${index}");
                    if (index == channels.length) {
                      if (error != null) {
                        return TextButton(
                          onPressed: () {
                            controller.streamChannelListController.retry();
                          },
                          child: Text(error.message),
                        );
                      }
                      return loadingIndicator;
                    }

                    final Channel item = channels[index];
                    // log(item.)
                    log("item.extraData['name'].toString(): ${item.extraData['name'].toString()}");
                    return StreamChannel(
                      channel: item,
                      showLoading: false,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.CHAT_SCREEN, arguments: item);
                        },
                        child: ChatTile(
                          photoUrl: getChannelImage(item, context.currentUser!),
                          unreadCount: StreamBuilder<int>(
                            stream: item.state!.unreadCountStream,
                            initialData: item.state!.unreadCount,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data == 0) {
                                  return const SizedBox.shrink();
                                } else {
                                  return BadgeIndicator(
                                    count:
                                        '${snapshot.data! > 99 ? '99+' : snapshot.data}',
                                  );
                                }
                              }

                              return const SizedBox();
                            },
                          ),
                          userName: getChannelName(item, context.currentUser!),
                          lastmessage: StreamBuilder<Message?>(
                            stream: item.state!.lastMessageStream,
                            initialData: item.state!.lastMessage,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(snapshot.data!.text!);
                              }

                              return const SizedBox();
                            },
                          ),
                          // onTap: () {
                          //   // / Display a list of messages when the user taps on
                          //   // / an item. We can use [StreamChannel] to wrap our
                          //   // / [MessageScreen] screen with the selected channel.
                          //   // /
                          //   // / This allows us to use a built-in inherited widget
                          //   // / for accessing our `channel` later on.
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) => StreamChannel(
                          //         channel: _item,
                          //         child: const MessageScreen(),
                          //       ),
                          //     ),
                          //   );
                          // },
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            loading: () => Center(
              child: loadingIndicator,
            ),
            error: (e) => Center(
              child: Text(
                'Oh no, something went wrong. '
                'Please check your config. $e',
              ),
            ),
          );
        },
      ),
    );
  }
}





// ListView.builder(
//           itemCount: 5,
//           itemBuilder: (context, index) {
//             return InkWell(
//               onTap: () => Get.toNamed(Routes.CHAT_SCREEN),
//               child: const ChatTile(
//                 userName: "Cavin",
//                 lastmessage:
//                     "Hey buddy i was about messsage you how are you and hows everything going",
//                 unreadCount: "1",
//               ),
//             );
//           },
//         )