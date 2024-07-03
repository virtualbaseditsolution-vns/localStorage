import 'package:assignment/data/user/user_controller.dart';
import 'package:assignment/data/user/user_model.dart';
import 'package:assignment/utils/helpers.dart';
import 'package:assignment/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/ui_utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  UserController userController = Get.find<UserController>();

  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool viewPassword = false;
  bool viewCPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:LayoutBuilder(
          builder: (context,size){
            return Center(
              child: SizedBox(
                width: size.maxWidth>600?600:size.maxWidth,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    SizedBox(height: size.maxWidth>600?60:MediaQuery.of(context).size.height*0.2,),
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
                                Center(child: Text("Sign Up",style: heading3,)),
                                vSpaceBig,
                                TextFormField(
                                  controller: name,
                                  validator: (val)=>Validators.empty(val!,"Name required"),
                                  decoration: inputDecoration(
                                    hintText: "Full Name",
                                  ),
                                ),
                                vSpaceBig,
                                TextFormField(
                                  controller: mobile,
                                  // validator: (val)=>Validators.empty(val!,"Mobile required"),
                                  decoration: inputDecoration(
                                    hintText: "Mobile",
                                  ),
                                ),
                                vSpaceBig,
                                TextFormField(
                                  controller: email,
                                  validator: (val)=>Validators.email(val!),
                                  decoration: inputDecoration(
                                    hintText: "Email",
                                  ),
                                ),
                                vSpaceBig,
                                TextFormField(
                                  controller: password,
                                  validator: (val)=>Validators.validatePassword(val!),
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
                                TextFormField(
                                  controller: confirmPassword,
                                  validator: (val)=>Validators.confirmPassword(password.text, val!),
                                  obscureText: !viewCPassword,
                                  decoration: inputDecoration(
                                      suffixIcon: InkWell(onTap:(){
                                        setState(() {
                                          viewCPassword = !viewCPassword;
                                        });
                                      },child: Icon(!viewCPassword?CupertinoIcons.eye_slash:CupertinoIcons.eye,size: 25,),),
                                      hintText: "Confirm Password"),
                                ),
                                vSpaceBig,
                                ElevatedButton(onPressed: signUp, child: const Text("SignUp"))
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
                        Text("Already have an Account?",style: headingSmall,),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text("Login",style: headingSmall,))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        )
    );
  }

  void signUp()async{
    var form = formKey.currentState;
    if(form!.validate()){
      form.save();
      UserModel user = UserModel(
        name: name.text,
        email: email.text,
        mobile: mobile.text,
        password: password.text,
        createdTime: DateTime.timestamp()
      );
      var res = await userController.insertNewUser(user);
      Get.back();
      Helpers.showToastMessage(message: "Sign up successfully please login with your email and password");
    }
  }



}
