import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                children: [
                  _page(
                    1,
                    context,
                    "First See Learning",
                    "Forget about a from of paper all knowledge in one learning",
                    "Next",
                    "imagePath"
                  ),
                  _page(
                      2,
                      context,
                      "Connect With Everyone",
                      "Always keep in touch with your tutor & friend. Let's get connected.",
                      "Next",
                      "imagePath"
                  ),
                  _page(
                      2,
                      context,
                      "Always Fascinated Learning",
                      "Anywhere, anytime. The time is at our discretion so study whenever you want.",
                      "Get Started",
                      "imagePath"
                  ),
                ],
              ),
              Positioned(
                bottom: 70.h,
                  child: DotsIndicator(
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      activeColor: Colors.deepPurple,
                      color: Colors.grey,
                      size: const Size.square(8.0),
                      activeSize: const Size(10.0, 10.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                    ),
                  )
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String title, String subTitle, String buttonName, String imagePath ){
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Text("Image1"),
        ),
        Container(
            child: Text(title, style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),)
        ),
        Container(
            width: 375.w,
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: Text(subTitle, style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),)
        ),
        Container(
          width: 325.w,
          height: 50.h,
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.all(Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0,1),
                )
              ]
          ),
          child: Center(
            child: Text(buttonName, style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.normal,
            ),
            ),

          ),

        ),
      ],
    );
  }



}
