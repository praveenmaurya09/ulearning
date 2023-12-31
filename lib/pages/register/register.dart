import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/pages/register/bloc/register_blocs.dart';
import 'package:ulearning/pages/register/bloc/register_events.dart';
import 'package:ulearning/pages/register/bloc/register_states.dart';
import 'package:ulearning/pages/register/register_controller.dart';


import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(builder: (context, state){
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                      child: reusableText("Enter your details below and free sign up")),
                  Container(
                    margin: EdgeInsets.only(top: 30.h),
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User Name"),
                        buildTextField(
                            "Enter your username", "email", "user", (value) {
                          context.read<RegisterBlocs>().add(UserNameEvent(value));
                        }),
                        reusableText("Email"),
                        buildTextField(
                            "Enter your email address", "email", "user", (value) {
                          context.read<RegisterBlocs>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your password", "password", "lock", (value) {
                          context.read<RegisterBlocs>().add(PasswordEvent(value));
                        }),
                        reusableText("Confirm Password"),
                        buildTextField("Please, confirm your password", "password", "lock",
                                (value) {
                              context.read<RegisterBlocs>().add(RePasswordEvent(value));
                            }),
                        reusableText("By creating an account you have to accept with our terms & conditions."),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  buildLogInAndRegButton("Sign Up", "login", () {
                    // Navigator.of(context).pushNamed("register");
                    RegisterController(context: context).handleEmailRegister();
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
