import 'package:assignment/config/routes/routes_name.dart';
import 'package:assignment/data/dashboard/dashboard_controller.dart';
import 'package:assignment/data/dashboard/dashboard_model.dart';
import 'package:assignment/data/user/user_controller.dart';
import 'package:assignment/utils/ui_utils.dart';
import 'package:assignment/views/cameras_profile.dart';
import 'package:assignment/widgets/app_widget.dart';
import 'package:assignment/widgets/drawer_menu.dart';
import 'package:assignment/widgets/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  UserController userController = Get.find<UserController>();

  DashboardController dashboardController = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
    getData();
  }


  getData()async{
    await dashboardController.getCameraData();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          TopBar(
            title: "Cameras",
            leading: IconButton(
              onPressed: (){
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(onPressed: ()async{

                await userController.userLogout(context);

              }, icon: const Icon(Icons.power_settings_new))
            ],
          ),
          Expanded(
            child: GetBuilder<DashboardController>(
              builder: (dashCtrl) {
                if(dashCtrl.isLoading){
                  return const LoadingShimmer(length: 10,);
                }
                if(dashCtrl.data!=null){
                  return ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    children: List.generate(dashCtrl.data!.photos!.length, (index){
                      Photos cc = dashCtrl.data!.photos![index];
                      return GestureDetector(
                        onTap: (){
                          // Get.toNamed(RoutesName.camerasProfile,arguments: "ajsbfkshdfk");
                          Get.to(()=>CamerasProfile(data: cc,));
                        },
                        child: Card(
                          elevation: 0.1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(cc.imgSrc!,fit: BoxFit.cover,)),
                                ),
                                hSpaceBig,
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(cc.camera!.fullName.toString(),style: heading2,),
                                    Text("Earth Date: ${cc.earthDate}",style: smallText4,),
                                    Text("Sol: ${cc.sol}",style: smallText4,),
                                    vSpace,
                                    Text("Rover Name: ${cc.rover!.name}",style: smallText4,),
                                    Text("Status: ${cc.rover!.status}",style: smallText4,),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
                return ListView(
                  children:[],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
