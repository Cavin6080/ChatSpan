import 'dart:developer';

import 'package:chat_app/widgets/chat_tile.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import '../controllers/status_nav_controller.dart';

class StatusNavView extends StatelessWidget {
  final controller = Get.find<StatusNavController>();
  StatusNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        blur: 2,
        progressIndicator: loadingIndicator,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('StatusNavView'),
            centerTitle: true,
          ),
          body: PagedValueListenableBuilder<int, User>(
            valueListenable: controller.userListController,
            builder: (context, value, child) {
              return value.when(
                (users, nextPageKey, error) => LazyLoadScrollView(
                  onEndOfPage: () async {
                    if (nextPageKey != null) {
                      controller.userListController.loadMore(nextPageKey);
                    }
                  },
                  child: ListView.builder(
                    itemCount: (nextPageKey != null || error != null)
                        ? users.length + 1
                        : users.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == users.length) {
                        if (error != null) {
                          return TextButton(
                            onPressed: () {
                              controller.userListController.retry();
                            },
                            child: Text(error.message),
                          );
                        }
                        return loadingIndicator;
                      }

                      final _item = users[index];
                      // log("_item.image : ${_item.image}");
                      return GestureDetector(
                        onTap: () {
                          controller.createChannel(context, _item);
                        },
                        child: ChatTile(
                          userName: _item.name,
                          lastmessage: const SizedBox.shrink(),
                          photoUrl: _item.image ?? "",
                          unreadCount: "",
                        ),
                      );
                    },
                  ),
                ),
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
