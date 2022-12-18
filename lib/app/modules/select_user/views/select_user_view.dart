import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/app/modules/select_user/model/user_model.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/widgets/helpers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../controllers/select_user_controller.dart';

class SelectUserView extends GetView<SelectUserController> {
  const SelectUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading,
        progressIndicator: loadingIndicator,
        blur: 5,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('SelectUserView'),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemCount: userList.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  controller.onSubmit(context, userList[index]);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: Constant.avtarRadius,
                    backgroundImage: CachedNetworkImageProvider(
                      userList[index].photoURL,
                    ),
                  ),
                  title: Text(
                    userList[index].name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return 20.ph;
            },
          ),
        ),
      ),
    );
  }
}
