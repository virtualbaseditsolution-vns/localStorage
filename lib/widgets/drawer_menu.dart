import 'package:assignment/config/routes/routes_name.dart';
import 'package:assignment/utils/ui_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: primaryColor.shade200
                    ),
                      child: Center(child: Text("Cameras Management",style: heading,))),
                  ListTile(
                    title: Text("Dashboard",style: headingSmall,),
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.home),
                    ),
                  ),
                  ListTile(
                    title: Text("Users",style: headingSmall,),
                    onTap: (){
                      Get.back();
                      Get.toNamed(RoutesName.usersScreen);
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.person_2),
                    ),
                  )
                ],
              ),
            ),
            divider,
            vSpaceSmall,
            Column(
              children: [
                Text("Submitted By",style: smallText,),
                vSpaceSmall,
                Text("Vijay Bahadur",style: heading,),
                vSpaceSmall,
                Text("vbits.vns@gmail.com",style: headingSmall.copyWith(color: Colors.grey),),
              ],
            ),
            vSpaceBig
          ],
        ),
      ),
    );
  }
}
