import 'package:assignment/data/user/user_controller.dart';
import 'package:assignment/utils/ui_utils.dart';
import 'package:assignment/widgets/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  UserController userController = Get.find<UserController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserController>(
        builder: (userCtrl) {
          return Column(
            children: [
              TopNavBar(
                title: "Profile",
                actions: [
                  IconButton(onPressed: null, icon: const Icon(Icons.edit))
                ],
              ),
              SizedBox(
                height: 210,
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Colors.grey
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade400,
                        child: Icon(Icons.person,color: Colors.grey.shade200,size: 75,),
                      ),
                    )
                  ],
                ),
              ),
              vSpaceBig,
              Text(userController.user!.name!,style: heading2,),
              vSpaceBig,
              ListTile(
                title: Text("Mobile",style: headingSmall,),
                subtitle: Text(userCtrl.user!.mobile!),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.phone_android,color: Colors.grey,),
                ),
              ),
              ListTile(
                title: Text("Email",style: headingSmall,),
                subtitle: Text(userCtrl.user!.email!),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.mail_outline,color: Colors.grey,),
                ),
              ),
              ListTile(
                title: Text("Password",style: headingSmall,),
                subtitle: Text(userCtrl.user!.password!.toString().replaceRange(0, 5, "*****")),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.password,color: Colors.grey,),
                ),
              )
            ],
          );
        }
      ),
    );
  }
}
