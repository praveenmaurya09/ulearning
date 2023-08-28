import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_states.dart';
import 'package:ulearning/pages/sign_in/sign_in_controller.dart';

import 'package:ulearning/pages/common_widgets.dart';




class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBlocs, SignInSates>(
        builder: (context, state){
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Log In"),
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
                            buildTextField("Enter your email address", "email", "user",
                                (value){
                              context.read<SignInBlocs>().add(EmailEvent(value));
                                }
                            ),
                            SizedBox(height: 5.h,),
                            reusableText("Password"),
                            buildTextField("Enter your password", "password", "lock",
                                    (value){
                                  context.read<SignInBlocs>().add(PasswordEvent(value));
                                }
                            ),

                          ],
                        ),
                      ),
                      forgetPassword(),
                      buildLogInAndRegButton("Log In", "login",
                          (){
                            SignInController(context: context).handleSignIn("email");
                          }
                      ),
                      buildLogInAndRegButton("Register", "register",
                              (){
                            Navigator.of(context).pushNamed("register");
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
