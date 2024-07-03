import 'package:assignment/config/routes/routes_name.dart';
import 'package:assignment/data/user/user_controller.dart';
import 'package:assignment/utils/ui_utils.dart';
import 'package:assignment/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  UserController userController = Get.find<UserController>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool viewPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.2,),
          Center(
            child: Form(
              key: formKey,
              child: Card(
                elevation: 0.2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(child: Text("Login",style: heading3,)),
                      vSpaceBig,
                      TextFormField(
                        controller: userName,
                        validator: (val)=>Validators.email(val!),
                        decoration: inputDecoration(
                          hintText: "UserName",
                        ),
                      ),
                      vSpaceBig,
                      TextFormField(
                        controller: password,
                        validator: (val)=>Validators.empty(val!,"Password required"),
                        obscureText: !viewPassword,
                        decoration: inputDecoration(
                            suffixIcon: InkWell(onTap:(){
                              setState(() {
                                viewPassword = !viewPassword;
                              });
                            },child: Icon(!viewPassword?CupertinoIcons.eye_slash:CupertinoIcons.eye,size: 25,),),
                            hintText: "Password"),
                      ),
                      vSpaceBig,
                      ElevatedButton(onPressed: loginWith, child: const Text("Login"))
                    ],
                  ),
                ),
              ),
            ),
          ),
          vSpaceBig,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an Account?",style: headingSmall,),
              TextButton(onPressed: (){
                Get.toNamed(RoutesName.signUpScreen);
              }, child: Text("SignUp",style: headingSmall,))
            ],
          )
        ],
      )
    );
  }
  void loginWith()async{
    var form = formKey.currentState;
    if(form!.validate()){
      form.save();
      var user = await userController.loginWithEmail(userName.text, password.text);
    }

  }
}
