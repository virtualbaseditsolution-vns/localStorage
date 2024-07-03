import 'package:assignment/data/user/user_controller.dart';
import 'package:assignment/data/user/user_model.dart';
import 'package:assignment/widgets/app_widget.dart';
import 'package:assignment/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsersPages extends StatefulWidget {
  const UsersPages({super.key});

  @override
  State<UsersPages> createState() => _UsersPagesState();
}

class _UsersPagesState extends State<UsersPages> {

  UserController userController = Get.find<UserController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  getUsers()async{
    await userController.getAllUsers();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopNavBar(
            title: "Users",
          ),
          Expanded(child: GetBuilder<UserController>(
            builder: (userCtrl) {
              if(userCtrl.isLoading){
                return const LoadingShimmer(length: 10,);
              }
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: userCtrl.users.length,
                itemBuilder:(context,index){
                  UserModel user = userCtrl.users[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(user.name!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if(user.mobile!=null && user.mobile!="")Text(user.mobile!),
                            Text(user.email!),
                          ],
                        ),
                        leading: CircleAvatar(backgroundColor: Colors.grey.shade300,),
                      ),
                    ),
                  );
              }
              );
            }
          ))
        ],
      ),
    );
  }
}
