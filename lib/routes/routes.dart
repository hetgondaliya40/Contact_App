import 'package:flutter/cupertino.dart';

import '../views/screens/add_contact_page.dart';
import '../views/screens/contact_detail_page.dart';
import '../views/screens/edit_contact_page.dart';
import '../views/screens/home_page.dart';
import '../views/screens/splash_screen.dart';

class Routes {
  static String splashscreen = "/";
  static String homepage = "home_page";
  static String detailspage = "details_page";
  static String editpage = "edit_page";
  static String addpage = "add_page";

  static Map<String, WidgetBuilder> myRoutes = {
    splashscreen: (context) => const SplashScreenPage(),
    homepage: (context) => const HomePage(),
    detailspage: (context) => const ContactDetailPage(),
    editpage: (context) => const EditContactPage(),
    addpage: (context) => const AddContactPage(),
  };
}
