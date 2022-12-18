import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/initial_bindings.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:stream_chat_persistence/stream_chat_persistence.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set the chatPersistenceClient for offline support

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final client = StreamChatClient(Constant.STREAM_KEY);
  // client.chatPersistenceClient = StreamChatPersistenceClient(
  //   logLevel: Level.INFO,
  //   connectionMode: ConnectionMode.background,
  // );
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
      initialRoute: Routes.ONBOARDING,
      debugShowCheckedModeBanner: false,
      // initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      getPages: AppPages.routes,
      builder: (ctx, child) {
        return StreamChatCore(
          client: client,
          child: StreamChat(
            client: client,
            child: StreamChatTheme(
              data: StreamChatThemeData(
                messageListViewTheme: const StreamMessageListViewThemeData(
                  backgroundColor: Colors.white,
                ),
                ownMessageTheme: const StreamMessageThemeData(
                  reactionsBackgroundColor: Colors.black,
                  messageBackgroundColor: Colors.white,
                ),
              ),
              child: child!,
            ),
          ),
        );
      },
    );
  }
}
