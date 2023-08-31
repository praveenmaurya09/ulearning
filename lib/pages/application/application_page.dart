import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/application/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.h),
                    topRight: Radius.circular(20.h)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ]),
            child: BottomNavigationBar(
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryElement,
              unselectedItemColor: AppColors.primaryFourthElementText,
              items: [
                BottomNavigationBarItem(
                  label: "home",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/home.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/home.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "search",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/search2.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/search2.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "course",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/play-circle1.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/play-circle1.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "chat",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/message-circle.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/message-circle.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "profile",
                  icon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset("assets/icons/person2.png"),
                  ),
                  activeIcon: SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: Image.asset(
                      "assets/icons/person2.png",
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
