import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/animation/scale_animation.dart';
import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:chat_app/widgets/chat_tile.dart';
import 'package:chat_app/widgets/custom_dialog.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:chat_app/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../controllers/chat_nav_controller.dart';

class ChatNavView extends StatelessWidget {
  final controller = Get.find<ChatNavController>();
  ChatNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        blur: 3,
        progressIndicator: loadingIndicator,
        child: Scaffold(
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
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: (nextPageKey != null || error != null)
                            ? channels.length + 1
                            : channels.length,
                        itemBuilder: (BuildContext context, int index) {
                          // log("indexL : ");
                          if (index == channels.length) {
                            if (error != null) {
                              return TextButton(
                                onPressed: () {
                                  controller.streamChannelListController
                                      .retry();
                                },
                                child: Text(error.message),
                              );
                            }
                            return loadingIndicator;
                          }

                          final Channel item = channels[index];
                          // log("item.extraData['name'].toString(): ${item.extraData['name'].toString()}");
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: StreamChannel(
                                  channel: item,
                                  showLoading: false,
                                  child: CustomAnimatedScale(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.CHAT_SCREEN,
                                        arguments: item,
                                      );
                                    },
                                    child: Slidable(
                                      key: UniqueKey(),
                                      endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        dismissible: DismissiblePane(
                                          onDismissed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CustomDialog(
                                                  onDeleteTap: () {},
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        children: [
                                          SlidableAction(
                                            onPressed: (BuildContext context) {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return CustomDialog(
                                                    onDeleteTap: () async {
                                                      Get.back();
                                                      controller.isLoading =
                                                          true;
                                                      await controller
                                                          .streamChannelListController
                                                          .deleteChannel(item);
                                                      controller.isLoading =
                                                          false;
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            autoClose: true,
                                            backgroundColor:
                                                const Color(0xFFFE4A49),
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            label: 'Delete',
                                          ),
                                        ],
                                      ),
                                      child: ChatTile(
                                        channel: item,
                                        photoUrl: getChannelImage(
                                            item, context.currentUser!),
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
                                        userName: getChannelName(
                                            item, context.currentUser!),
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
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
        ),
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