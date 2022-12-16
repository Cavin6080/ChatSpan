import 'package:chat_app/widgets/chat_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_nav_controller.dart';

class ChatNavView extends GetView<ChatNavController> {
  const ChatNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ChatTile(
            userName: "Cavin",
            lastmessage:
                "Hey buddy i was about messsage you how are you and hows everything going",
            unreadCount: "1",
          );
        },
      ),
    );
  }
}
