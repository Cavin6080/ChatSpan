import 'dart:developer';

import 'package:chat_app/app/extensions/empty_padding_extension.dart';
import 'package:chat_app/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    log("build called of navigation");
    final PageStorageBucket bucket = PageStorageBucket();

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Chat'),
      //   centerTitle: true,
      //   leading: const SizedBox(),
      // ),
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Obx(
          () => Text(
            controller.currPage.value == 0
                ? 'Call'
                : controller.currPage.value == 1
                    ? "Chat"
                    : controller.currPage.value == 2
                        ? "Maps"
                        : "Status",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        centerTitle: true,
        actions: [
          Obx(
            () => controller.currPage.value == 1
                ? const ProfileImage()
                : const SizedBox(),
          ),
          10.pw
        ],
      ),
      // body: resizeToAvoidBottomInset: false,
      body: Obx(() => PageStorage(
            bucket: bucket,
            child: controller.screens[controller.currPage.value],
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(3.0),
        child: FloatingActionButton(
          elevation: 1,
          mini: true,
          onPressed: () {},
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),

          backgroundColor: Colors.amber,
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Container(
          decoration: const BoxDecoration(
            // color: secondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  controller.currScreen = controller.screens[0];
                  controller.currPage.value = 0;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/call.svg",
                      color: Colors.amber,
                    ),
                    // Text(
                    //   'Home',
                    // )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  controller.currScreen = controller.screens[1];
                  controller.currPage.value = 1;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/chat.svg",
                      color: Colors.amber,
                    ),
                    // Text(
                    //   'Home',
                    // )
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  controller.currScreen = controller.screens[2];
                  controller.currPage.value = 2;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/map.svg",
                      height: 25,
                      color: Colors.amber,
                    ),
                    // Text(
                    //   'Home',
                    // )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  controller.currScreen = controller.screens[3];
                  controller.currPage.value = 3;
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/status.svg",
                      color: Colors.amber,
                      height: 30,
                    ),
                    // Text(
                    //   'Home',
                    // )
                  ],
                ),
              ),

              // MaterialButton(
              //   minWidth: 40,
              //   onPressed: () {
              //     setState(() {
              //       currScreen = ProfilePageSP();
              //       currPage = 4;
              //     });
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         currPage == 4 ? Icons.person : Icons.person_outline,
              //         color: currPage == 4 ? primaryColor : Colors.white,
              //       ),
              //       Text(
              //         'Profile',
              //         style: labelTextStyle.copyWith(
              //           color: Colors.white,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
