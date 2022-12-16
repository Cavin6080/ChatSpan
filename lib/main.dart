import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/initial_bindings.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

import 'app/routes/app_pages.dart';

void main() {
  final client = StreamChatClient(Constant.STREAM_KEY);
  runApp(
    MyApp(client: client),
  );
}

class MyApp extends StatelessWidget {
  final StreamChatClient client;
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: Routes.SELECT_USER,
      debugShowCheckedModeBanner: false,
      // initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      getPages: AppPages.routes,
      builder: (ctx, child) {
        return StreamChatCore(
          client: client,
          child: child!,
        );
      },
    );
  }
}
