import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';

AppBar buildAppbar(){
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),

          ),
            Text("Profile", style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
                fontSize: 16.sp
            ),),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/more-vertical.png"),

          ),
        ],
      ),
    ),
  );
}


// profile icon and edit button widget
Widget profileIconAndEditButton(){
  return Container(
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        image: const DecorationImage(
            image: AssetImage("assets/icons/headpic.png")
        )
    ),
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,
    child: Image(
        width: 25.w,
        height: 25.h,
        image: AssetImage("assets/icons/edit_3.png",)),
  );
}