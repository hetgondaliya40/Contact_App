import 'package:contectttttttt/routes/routes.dart';
import 'package:contectttttttt/views/screens/add_contact_page.dart';
import 'package:contectttttttt/views/screens/contact_detail_page.dart';
import 'package:contectttttttt/views/screens/edit_contact_page.dart';
import 'package:contectttttttt/views/screens/home_page.dart';
import 'package:contectttttttt/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isGrid = false;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Light Theme
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      //Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: Routes.splashscreen,
      routes: {
        Routes.addpage: (context) => const AddContactPage(),
        Routes.editpage: (context) => const EditContactPage(),
        Routes.detailspage: (context) => const ContactDetailPage(),
        Routes.splashscreen: (context) => const SplashScreenPage(),
        Routes.homepage: (context) => const HomePage(),
      },
    );
  }
}
