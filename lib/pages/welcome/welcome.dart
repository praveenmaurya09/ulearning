import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';


import 'package:ulearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: Scaffold(body: BlocBuilder<WelcomeBlocs, WelcomeStates>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    // to track the page index of the screen
                    // print("index value is ${index}");
                    state.page = index;
                    BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvents());
                  },
                  children: [
                    _page(
                        1,
                        context,
                        "First See Learning",
                        "Forget about a from of paper all knowledge in one learning",
                        "Next",
                        "assets/images/reading.png"),
                    _page(
                        2,
                        context,
                        "Connect With Everyone",
                        "Always keep in touch with your tutor & friend. Let's get connected.",
                        "Next",
                        "assets/images/boy.png"),
                    _page(
                        3,
                        context,
                        "Always Fascinated Learning",
                        "Anywhere, anytime. The time is at our discretion so study whenever you want.",
                        "Get Started",
                        "assets/images/man.png"),
                  ],
                ),
                Positioned(
                    bottom: 70.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                          activeColor: AppColors.primaryElement,
                          color: AppColors.primaryGreyBackground,
                          size: const Size.square(8.0),
                          activeSize: const Size(15.0, 10.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String title, String subTitle,
      String buttonName, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        Container(
            width: 375.w,
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Text(
              subTitle,
              style: TextStyle(
                color: AppColors.primarySecondElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            )),
        GestureDetector(
          onTap: () {
            // Within 0-2 index
            if (index < 3) {
              //animation
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              // Jump to new page
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));
              Navigator.of(context).pushNamedAndRemoveUntil("/sign_in", (route) => false);

            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primarySecondaryBackground,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
