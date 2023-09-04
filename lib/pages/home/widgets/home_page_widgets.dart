import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar(){
  return AppBar(
        title: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 15.w,
                height: 12.h,
                child: Image.asset("assets/icons/menu.png"),
              ),
              GestureDetector(
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      // Todo :- Replace the AssetImage with the Network Image later
                      image: AssetImage("assets/icons/person.png")
                    )
                  ),
                ),
              )
            ],
          ),
        ),
  );
}

// big reusable text widget
Widget homePageText(String text,{Color? color=AppColors.primaryText, int? top}){
  return Container(
    margin: EdgeInsets.only(top: top!.h),
    child: Text(text, style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold
    ),),
  );
}

Widget searchView(){
  return Container();
}