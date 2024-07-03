import 'package:assignment/data/user/user_controller.dart';
import 'package:assignment/utils/ui_utils.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {




  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      UserController().hasUserLogin();
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Assignment",style: headingBold,),
      ),
    );
  }
}
