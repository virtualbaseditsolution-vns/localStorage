
import 'package:assignment/config/routes/routes_name.dart';
import 'package:assignment/views/cameras_profile.dart';
import 'package:assignment/views/dashboard.dart';
import 'package:assignment/views/login.dart';
import 'package:assignment/views/signup_page.dart';
import 'package:assignment/views/splashscreen.dart';
import 'package:assignment/views/user_profile.dart';
import 'package:assignment/views/users/users.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreenPage());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context)=>const LoginPage());
      case RoutesName.signUpScreen:
        return MaterialPageRoute(builder: (context)=>const SignUpPage());
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(builder: (context)=>const Dashboard());
      case RoutesName.camerasProfile:
        return MaterialPageRoute(builder: (context)=>const CamerasProfile());
      case RoutesName.usersScreen:
        return MaterialPageRoute(builder: (context)=>const UsersPages());
      case RoutesName.userProfile:
        return MaterialPageRoute(builder: (context)=>const UserProfile());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text("No Route generated"),
            ),
          );
        });
    }
  }
}