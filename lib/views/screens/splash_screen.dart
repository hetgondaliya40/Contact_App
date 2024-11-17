import 'dart:async';

import 'package:flutter/material.dart';

import '../../routes/routes.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  FlutterLogoStyle myStyle = FlutterLogoStyle.markOnly;

  void changeScreen() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        myStyle = FlutterLogoStyle.horizontal;
      });
    });

    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(Routes.homepage);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Image(
              image: NetworkImage(
                  'https://img.freepik.com/free-vector/call-center_24877-49048.jpg?t=st=1731856496~exp=1731860096~hmac=f5ebcb6999a84a7b8f9cb58edb7408ec155b75c0e3f1e50479a2bbd919061f04&w=900'),
            ),
            const Spacer(),
            CircularProgressIndicator(
              backgroundColor: Colors.red.shade200,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
