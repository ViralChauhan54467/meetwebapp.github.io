import 'package:flutter/material.dart';
import 'package:meetwebapp/constants/app_colors.dart';
import 'package:meetwebapp/provider/auth_provider.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    AuthProvider().moveToNextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.screenBGColor,
      body: Container(),
    );
  }
}
