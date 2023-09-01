import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/widgets/flutter_toast.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context,});

  void handleSignIn(String type) async {
    try{
      if(type=="email"){
        //BlocProvider.of<SignInBlocs>(context).state;
        final state = context.read<SignInBlocs>().state;
        String emailAddress = state.email;
        String password = state.password;
        if(emailAddress.isEmpty){
          // some message
          toastInfo(msg: "Email address can't be empty.");
          return;
        }
        if(password.isEmpty){
          // some message
          toastInfo(msg: "Password can't be empty.");
          return;
        }
        try{
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: emailAddress, password: password);

          if(credential.user==null){
            toastInfo(msg: "user doesn't exist");
            return;
          }
          if(!credential.user!.emailVerified){
            toastInfo(msg: "Please verified your email account");
            return;
          }
          var user = credential.user;
          if(user!=null){
            //print("user exist");
            // toastInfo(msg: "No user found.");
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
            // We got verified user from the firebase
          }else{
            //print("no user");
            toastInfo(msg: "Currently you are not user of this app.");
            return;
            // We have error getting user from firebase
          }
        }
        on FirebaseAuthException catch(e){
            if(e.code == 'user-not-found'){
              //print('No user found for that email.');
              toastInfo(msg: "No user found for that email.");
            } else if(e.code == "wrong-password") {
              // print('Wrong password provided for that user.');
              toastInfo(msg: "Wrong password provided for that user.");
            }
            else if(e.code == "invalid-email") {
              // print('Your email is invalid.');
              toastInfo(msg: "Your email is invalid.");
            }

        }
      }
    }
    catch(e){}
  }


}
