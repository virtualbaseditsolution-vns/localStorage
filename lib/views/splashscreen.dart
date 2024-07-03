import 'package:assignment/data/user/user_controller.dart';
import 'package:assignment/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      UserController().hasUserLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Shimmer.fromColors(
                  loop: 100,
                    baseColor: Colors.grey.shade700,
                    highlightColor: Colors.orange,
                    child: Text(
                      "Assignment",
                      style: heading3,
                    )),
                vSpaceBig,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("1- Login / Signup Page with local db, once signup same credentials use for login"
                      "\n2- Once complete show a notification to user for signup"
                      "\n3- After login dashboard where need to show list and details using this api"
                      "\nhttps://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY"
                      "\n4- Profile page need to show detail of user"
                      "\n5- All created user also needs to show inside app",style: smallText,),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
