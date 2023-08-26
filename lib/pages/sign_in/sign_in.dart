import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:ulearning/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(child: reusableText("Or use your email account to login")),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      buildTextField("Enter your email address", "email", "user"),
                      SizedBox(height: 5.h,),
                      reusableText("Password"),
                      buildTextField("Enter your password", "password", "lock"),

                    ],
                  ),
                ),
                forgetPassword(),
                buildLogInAndRegButton("Log In", "login"),
                buildLogInAndRegButton("Register", "register"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
