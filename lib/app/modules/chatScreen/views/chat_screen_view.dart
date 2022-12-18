import 'dart:developer';
import 'package:flutter/foundation.dart' as foundation;
import 'package:chat_app/app/extensions/stream_chat_extension.dart';
import 'package:chat_app/app/modules/chatScreen/views/message_bubble.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/widgets/chat_app_bar.dart';
import 'package:chat_app/widgets/chat_screen_widgets/action_bar.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:star_menu/star_menu.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../controllers/chat_screen_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final data = MessageGenerator.generate(60, 1337);
    return WillPopScope(
      onWillPop: () {
        if (controller.showEmoji.value) {
          controller.showEmoji.value = false;
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: StreamChannel(
        channel: controller.channel,
        child: Scaffold(
          appBar: ChatScreenApBar(
            photoUrl: getChannelImage(controller.channel, context.currentUser!),
            userName: getChannelName(
              controller.channel,
              context.currentUser!,
            ),
          ),
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    // child: StreamMessageListView(
                    //   showFloatingDateDivider: false,
                    //   // threadBuilder: (_, parentMessage) {
                    //   //   return ThreadPage(
                    //   //     parent: parentMessage,
                    //   //   );
                    //   // },
                    //   spacingWidgetBuilder: (context, spacingTypes) =>
                    //       SizedBox.shrink(),
                    //   // messageListBuilder: ,
                    //   dateDividerBuilder: (date) {
                    //     return FittedBox(
                    //       fit: BoxFit.scaleDown,
                    //       child: Container(
                    //         padding: const EdgeInsets.all(10),
                    //         // width: 100,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(20),
                    //             gradient: const LinearGradient(
                    //               begin: Alignment.topRight,
                    //               end: Alignment.bottomLeft,
                    //               colors: [
                    //                 Color(0xFF19B7FF),
                    //                 Color(0xFF491CCB),
                    //               ],
                    //             )),
                    //         child: Center(
                    //           child: Text(
                    //             "${controller.customdate(date.toLocal())}",
                    //             style:
                    //                 Theme.of(context).textTheme.bodyMedium?.copyWith(
                    //                       color: Colors.white,
                    //                     ),
                    //           ),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    //   // unreadMessagesSeparatorBuilder: ,
                    //   // reactionBuilder:
                    //   messageBuilder:
                    //       (context, messageDetails, messageList, defaultWidget) {
                    //     return defaultWidget.copyWith(
                    //       widthFactor: 3,
                    //       showReactionPickerIndicator: false,
                    //       // borderRadiusGeometry: BorderRadius.zero,
                    //       attachmentBorderRadiusGeometry: BorderRadius.circular(20),
                    //       attachmentPadding:
                    //           const EdgeInsets.symmetric(horizontal: 10),
                    //       imageAttachmentThumbnailSize: Size(
                    //         MediaQuery.of(context).size.width * 0.5,
                    //         MediaQuery.of(context).size.height * 0.2,
                    //       ),

                    //       showReactions: true,
                    //       showFlagButton: true,
                    //       padding: EdgeInsets.zero,
                    //       showUserAvatar: DisplayWidget.hide,
                    //       borderSide: BorderSide.none,
                    //       textPadding: EdgeInsets.zero,
                    //       showTimestamp: false,
                    //       showUsername: false,
                    //       // messageTheme: StreamMessageThemeData(
                    //       //     // messageBackgroundColor: Colors.white,
                    //       //     ),
                    //       textBuilder: (ctx, message) => MessageBubble(
                    //         message: message,
                    //         child: Text(message.text ?? ""),
                    //       ),
                    //     );
                    //   },
                    // ),
                    child: MessageListCore(
                      emptyBuilder: (context) => Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/no_data.svg",
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.5,
                          ),
                          const Text("No messages"),
                        ],
                      )),
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
                              log("message.type: ${message.type}");
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
                  // StreamMessageInput(
                  //   enableActionAnimation: true,
                  //   sendButtonLocation: SendButtonLocation.inside,
                  //   textInputAction: TextInputAction.done,
                  //   attachmentButtonBuilder: (context, attachmentButton) {
                  //     return attachmentButton.copyWith(
                  //       color: const Color(0xFF491CCB),
                  //     );
                  //   },
                  //   idleSendButton: Padding(
                  //     padding: const EdgeInsets.only(right: 8.0),
                  //     child: Icon(
                  //       Icons.send,
                  //       color: Colors.grey.shade400,
                  //     ),
                  //   ),
                  //   activeSendButton: const Padding(
                  //     padding: EdgeInsets.only(right: 10.0),
                  //     child: Icon(
                  //       Icons.send,
                  //       color: Color(0xFF491CCB),
                  //     ),
                  //   ),
                  // ),
                  ActionBar(),
                  Obx(
                    () => controller.showEmoji.value
                        ? Flexible(
                            child: EmojiPicker(
                              // onEmojiSelected: (Category category, Emoji emoji) {
                              //     // Do something when emoji is tapped (optional)
                              // },
                              onBackspacePressed: () {
                                // Do something when the user taps the backspace button (optional)
                              },
                              textEditingController: controller.controller,
                              config: Config(
                                columns: 7,
                                emojiSizeMax: 32 *
                                    (foundation.defaultTargetPlatform ==
                                            TargetPlatform.iOS
                                        ? 1.30
                                        : 1.0),
                                verticalSpacing: 0,
                                horizontalSpacing: 0,
                                gridPadding: EdgeInsets.zero,
                                initCategory: Category.RECENT,
                                bgColor: Color(0xFFF2F2F2),
                                indicatorColor: Colors.blue,
                                iconColor: Colors.grey,
                                iconColorSelected: Colors.blue,
                                backspaceColor: Colors.blue,
                                skinToneDialogBgColor: Colors.white,
                                skinToneIndicatorColor: Colors.grey,
                                enableSkinTones: true,
                                showRecentsTab: true,
                                recentsLimit: 28,
                                noRecents: const Text(
                                  'No Recents',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black26),
                                  textAlign: TextAlign.center,
                                ), // Needs to be const Widget
                                loadingIndicator: const SizedBox
                                    .shrink(), // Needs to be const Widget
                                tabIndicatorAnimDuration: kTabScrollDuration,
                                categoryIcons: const CategoryIcons(),
                                buttonMode: ButtonMode.MATERIAL,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// controller.showEmoji.value
//                       ? EmojiPicker(
//                           // onEmojiSelected: (Category category, Emoji emoji) {
//                           //     // Do something when emoji is tapped (optional)
//                           // },
//                           onBackspacePressed: () {
//                             // Do something when the user taps the backspace button (optional)
//                           },
//                           // textEditingController: controller.ed,
//                           config: Config(
//                             columns: 7,
//                             emojiSizeMax: 32 *
//                                 (foundation.defaultTargetPlatform ==
//                                         TargetPlatform.iOS
//                                     ? 1.30
//                                     : 1.0),
//                             verticalSpacing: 0,
//                             horizontalSpacing: 0,
//                             gridPadding: EdgeInsets.zero,
//                             initCategory: Category.RECENT,
//                             bgColor: Color(0xFFF2F2F2),
//                             indicatorColor: Colors.blue,
//                             iconColor: Colors.grey,
//                             iconColorSelected: Colors.blue,
//                             backspaceColor: Colors.blue,
//                             skinToneDialogBgColor: Colors.white,
//                             skinToneIndicatorColor: Colors.grey,
//                             enableSkinTones: true,
//                             showRecentsTab: true,
//                             recentsLimit: 28,
//                             noRecents: const Text(
//                               'No Recents',
//                               style: TextStyle(
//                                   fontSize: 20, color: Colors.black26),
//                               textAlign: TextAlign.center,
//                             ), // Needs to be const Widget
//                             loadingIndicator: const SizedBox
//                                 .shrink(), // Needs to be const Widget
//                             tabIndicatorAnimDuration: kTabScrollDuration,
//                             categoryIcons: const CategoryIcons(),
//                             buttonMode: ButtonMode.MATERIAL,
//                           ),
//                         )
//                       : 