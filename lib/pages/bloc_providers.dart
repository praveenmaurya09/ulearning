import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/register/bloc/register_blocs.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';


class AppBlocProviders{
  static get allBlocProviders => [
    BlocProvider(create: (context) => WelcomeBlocs(),),
    // BlocProvider(create: (context) => AppBlocs(),),
    BlocProvider(create: (context) => SignInBlocs(),),
    BlocProvider(create: (context) => RegisterBlocs(),),
  ];
}