class Validators{

  static String? empty(String val,String message){
    if(val.isEmpty){
      return message;
    }else{
      return null;
    }
  }


  static String? email(String value){
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (value.isEmpty) {
      return "Email required";
    } else if (!regex.hasMatch(value)) {
      return "Invalid email!";
    } else {
      return null;
    }
  }

  /// Validation for Password
  static String? validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return "Password required";
    } else if (value.length < 5) {
      return "Your password must be at least 5 characters";
    } else {
      if (!regex.hasMatch(value)) {
        return "Your password must be at least 5 characters including a lowercase letter, an uppercase letter, and a number";
      } else {
        return null;
      }
    }
  }
  /// Validation for Password
  static String? confirmPassword(String password,String value) {

    if (value.isEmpty) {
      return "Password required";
    } else if (password!=value) {
      return "Your password does not match with your password";
    }else{
      return null;
    }
  }





}