import 'package:get/get.dart';

import '../modules/callNav/bindings/call_nav_binding.dart';
import '../modules/callNav/views/call_nav_view.dart';
import '../modules/chatNav/bindings/chat_nav_binding.dart';
import '../modules/chatNav/views/chat_nav_view.dart';
import '../modules/contactsNav/bindings/contacts_nav_binding.dart';
import '../modules/contactsNav/views/contacts_nav_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mapsNav/bindings/maps_nav_binding.dart';
import '../modules/mapsNav/views/maps_nav_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/statusNav/bindings/status_nav_binding.dart';
import '../modules/statusNav/views/status_nav_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_NAV,
      page: () => const ChatNavView(),
      binding: ChatNavBinding(),
    ),
    GetPage(
      name: _Paths.MAPS_NAV,
      page: () => const MapsNavView(),
      binding: MapsNavBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTS_NAV,
      page: () => const ContactsNavView(),
      binding: ContactsNavBinding(),
    ),
    GetPage(
      name: _Paths.CALL_NAV,
      page: () => const CallNavView(),
      binding: CallNavBinding(),
    ),
    GetPage(
      name: _Paths.STATUS_NAV,
      page: () => const StatusNavView(),
      binding: StatusNavBinding(),
    ),
  ];
}
