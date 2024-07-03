import 'package:assignment/services/apiClients/base_clients.dart';
import 'package:get/get.dart';

import 'dashboard_model.dart';

class DashboardController extends GetxController{

  CameraModel? data;
  bool isLoading = false;

  String baseUrl = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=DEMO_KEY";



  Future<void> getCameraData()async{
    isLoading=true;
    update();
    var res = await CallApi.get(baseUrl, "");
    if(res!=null){
      data = CameraModel.fromJson(res);
    }
    isLoading=false;
    update();
  }



}