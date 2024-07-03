
import 'package:get/get.dart';

import '../../utils/helpers.dart';
import 'app_exceptions.dart';

class BaseController{
  static void handleError(error){
    print("$error");
    if(Get.isDialogOpen!) Get.back();
    if(error is BadRequestException)
    {
      var message=error.message;
      Helpers.showToastMessage(message: message);
    }
    else if(error is FetchDataException)
    {
      var message=error.message;
      //Helpers.alert(message:message!);
      Helpers.showToastMessage(message: message);
    }
    else if(error is ApiNotResponseException)
    {
      Helpers.showToastMessage(message:"Oops something went wrong, please try again later.",);
    }
  }
}