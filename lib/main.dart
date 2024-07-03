import 'package:assignment/config/routes/routes.dart';
import 'package:assignment/config/routes/routes_name.dart';
import 'package:assignment/data/user/user_controller.dart';
import 'package:assignment/db/database.dart';
import 'package:assignment/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  MainDataBase.instance;
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
        appBarTheme: AppBarTheme(color: primaryColor.shade300),
        useMaterial3: false,
      ).copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                disabledBackgroundColor: primaryColor.shade300,
                backgroundColor: primaryColor,
                padding: buttonPadding,
                textStyle: heading,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black87,
                padding: buttonPadding,
                textStyle: heading,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: headingMedium,
                foregroundColor: Colors.grey.shade500,
                elevation: 0,
              ))),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

