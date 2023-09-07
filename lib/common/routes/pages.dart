import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/home_page.dart';
import 'package:ulearning/pages/register/register.dart';
import 'package:ulearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';

import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/app_blocs.dart';
import '../../pages/register/bloc/register_blocs.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/welcome/welcome.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_)=> AppBlocs(),),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_)=> HomePageBlocs(),),
      ),
    ];
  }

  // return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
          blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // model that cover entire screen as we click on the navigator objects
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      // checking for the route matching when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("first log");

        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        if(result.first.route == AppRoutes.INITIAL&&deviceFirstOpen){
          bool isLoggedin = Global.storageService.getIsLoggedIn();

          if(isLoggedin){
            return MaterialPageRoute(builder: (_)=> const ApplicationPage(), settings: settings);
          }
          print("second log");
          return MaterialPageRoute(builder: (_)=> const SignIn(), settings: settings);
        }

        // print("valid route name ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

// unify blocProvider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
