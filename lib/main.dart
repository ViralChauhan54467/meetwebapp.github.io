import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:meetwebapp/constants/app_constants.dart';
import 'package:meetwebapp/screens/meet/meet_list_screen.dart';

import 'constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) {
            return GetMaterialApp(
              title: AppConstants.sMeetTitle,
              theme: ThemeData(
                appBarTheme: const AppBarTheme(
                  backgroundColor: AppColor.primaryColor,
                  iconTheme: IconThemeData(
                    color: AppColor.white,
                  ),
                ),
                colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              home: const MeetListScreen(),
            );
          },
        );
      });
    });

   /* return MaterialApp(
      title: AppConstants.sMeetTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MeetScreen(),
    );*/
  }
}