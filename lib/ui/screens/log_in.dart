import 'package:chat_app/helpers/snack_bar.dart';
import 'package:chat_app/style/app_colors/app_colors.dart';
import 'package:chat_app/ui/screens/chat.dart';
import 'package:chat_app/ui/screens/register.dart';
import 'package:chat_app/ui/widgets/custom_button.dart';
import 'package:chat_app/ui/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../style/images/images.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  static String routeName = "logIn";

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String? email;

  String? password;

  bool isLoaded = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        backgroundColor: AppColors.kPrimary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 180,
                ),
                Image(
                  image: AssetImage(Images.scholar),
                  height: 100,
                ),
                Center(
                  child: Text(
                    "Scholar Chat",
                    style: TextStyle(color: AppColors.kWhite, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text("Sign In",
                        style:
                            TextStyle(color: AppColors.kWhite, fontSize: 22)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    onChange: (eInput) {
                      email = eInput;
                    },
                    hintText: "Email"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    forSecurity: true,
                    onChange: (pInput) {
                      password = pInput;
                    },
                    hintText: "Password"),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoaded = true;
                        setState(() {});
                        try {
                          await signInUser();
                          Navigator.pushNamed(context, ChatScreen.routeName,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            snackBar(context, "No user found for that email.");
                          } else if (e.code == 'wrong-password') {
                            snackBar(context,
                                "Wrong password provided for that user.");
                          }
                        } catch (e) {
                          snackBar(context, "There is an error");
                        }
                        isLoaded = false;
                        setState(() {});
                      }
                    },
                    title: "LogIn",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account ",
                      style: TextStyle(color: AppColors.kWhite),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Color(0XFFC7EDE6)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 180,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInUser() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
