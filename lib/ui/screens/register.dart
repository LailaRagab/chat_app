import 'package:chat_app/style/app_colors/app_colors.dart';
import 'package:chat_app/ui/screens/chat.dart';
import 'package:chat_app/ui/screens/log_in.dart';
import 'package:chat_app/ui/widgets/custom_button.dart';
import 'package:chat_app/ui/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../helpers/snack_bar.dart';
import '../../style/images/images.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String routeName = "registerScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoaded = false;

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
                    Text("Register",
                        style:
                            TextStyle(color: AppColors.kWhite, fontSize: 22)),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    onChange: (inputE) {
                      email = inputE;
                    },
                    hintText: "Email"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    forSecurity: true,
                    onChange: (inputP) {
                      password = inputP;
                    },
                    hintText: "Password"),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoaded = true;
                      setState(() {});
                      try {
                        await registerAuth();
                        snackBar(context, "Success");
                        Navigator.pushNamed(context, ChatScreen.routeName,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "weak-password") {
                          snackBar(context, "weak-password");
                        } else if (e.code == "email-already-in-use") {
                          snackBar(context, "email-already-in-use");
                        }
                      } catch (e) {
                        snackBar(context, "There is an error");
                      }
                    }
                    isLoaded = false;
                    setState(() {});
                  },
                  title: "Register",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account ",
                      style: TextStyle(color: AppColors.kWhite),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context, LogInScreen.routeName);
                      },
                      child: const Text(
                        "Register",
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

  Future<void> registerAuth() async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
