import 'package:chat_app/app/modules/callNav/views/call_nav_view.dart';
import 'package:chat_app/app/modules/chatNav/views/chat_nav_view.dart';
import 'package:chat_app/app/modules/mapsNav/views/maps_nav_view.dart';
import 'package:chat_app/app/modules/statusNav/views/status_nav_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  Widget currScreen = ChatNavView();
  Rx<int> currPage = 1.obs;
  final List<Widget> screens = [
    CallNavView(),
    ChatNavView(),
    MapsNavView(),
    StatusNavView(),
  ];
}
