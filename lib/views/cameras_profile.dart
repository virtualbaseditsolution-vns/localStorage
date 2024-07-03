import 'package:assignment/data/dashboard/dashboard_model.dart';
import 'package:assignment/utils/ui_utils.dart';
import 'package:assignment/widgets/app_widget.dart';
import 'package:flutter/material.dart';

class CamerasProfile extends StatelessWidget {
  final Photos? data;
  const CamerasProfile({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    );
    if(data==null){
      return Scaffold(
        body: Center(child: Text("Page Not found",style: heading2,),),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          TopNavBar(
            title: data!.camera!.fullName,
          ),
          Expanded(child: ListView(
            padding: EdgeInsets.zero,
            children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data!.imgSrc!,),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation:0.2,
                    shape: shape,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(data!.camera!.fullName!,style: heading2,),
                          vSpace,
                          Text("Rover Name : ${data!.rover!.name}",style: headingSmall.copyWith(color: primaryColor),),
                          vSpaceSmall,
                          Text("Total Photos: ${data!.rover!.totalPhotos}",style: headingSmall.copyWith(color: Colors.green.shade700),),
                          vSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sol : ${data!.sol}",style: smallText2,),
                              Text("Max Sol : ${data!.rover!.maxSol}",style: smallText2,),
                              Text("Max Date : ${data!.rover!.maxDate}",style: smallText2,),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation:0.2,
                    shape: shape,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Cameras Names",style: heading,),
                          vSpace,
                          ...List.generate(data!.rover!.cameras!.length, (index){
                            var cc = data!.rover!.cameras![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius:15,
                                    backgroundColor: Colors.grey.shade200,
                                    child: Icon(Icons.camera,size: 15,color: primaryColor.shade400,),
                                  ),
                                  hSpace,
                                  Expanded(child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(cc.name!,style: headingSmall,),
                                      Text(cc.fullName!),
                                    ],
                                  )),
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  )
                ],
              ),)
            ],
          ))
        ],
      ),
    );
  }
}
