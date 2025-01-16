import 'package:chat_app/style/app_colors/app_colors.dart';
import 'package:chat_app/ui/screens/register.dart';
import 'package:chat_app/ui/widgets/custom_button.dart';
import 'package:chat_app/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../style/images/images.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  static String routeName="logIn";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(height: 180,),
            Image(image: AssetImage(Images.scholar) ,
            height: 100,),
            Center(
              child: Text("Scholar Chat",
                  style: TextStyle(
                    color: AppColors.kWhite,
                    fontSize: 30
                  ),
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              children: [
                Text("Sign In" ,
                style: TextStyle(
                color: AppColors.kWhite,
                fontSize: 22)
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const CustomTextField(hintText: "Email"),
            const SizedBox(height: 10,),
            const CustomTextField(hintText: "Password"),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RegisterScreen.routeName);
              },
                child:
                CustomButton(title: "LogIn",)
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("don't have an account ",
                style: TextStyle(
                  color: AppColors.kWhite
                ),),
                const Text("Sign Up",
                  style: TextStyle(
                      color: Color(0XFFC7EDE6)
                  ),),
              ],
            ),
            const SizedBox(height: 180,),
          ],
        ),
      ),
      
    );
  }
}
