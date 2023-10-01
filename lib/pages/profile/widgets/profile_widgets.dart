import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';

import '../../../common/widgets/base_text_widget.dart';

// Appbar for ProfilePage
AppBar buildAppbar() {
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
          reusableText("Profile"),
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
Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    padding: EdgeInsets.only(right: 6.w),
    alignment: Alignment.bottomRight,
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage(
        "assets/icons/edit_3.png",
      ),
    ),
  );
}

//Profile Page ListView buttons

var imagesInfo = <String, String>{
  "Settings" : "settings.png",
  "Payment Details": "credit-card.png",
  "Achievement": "award.png",
  "Love": "heart(1).png",
  "Learning Reminders": "cube.png"
};

Widget buildListView(BuildContext context){
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
        child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7.0),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.w),
                    color: AppColors.primaryElement
                ),
                child: Image.asset("assets/icons/${imagesInfo.values.elementAt(index)}"),
              ),
              SizedBox(width: 20.w,),
              reusableText(
                imagesInfo.keys.elementAt(index),),
            ],
          ),
        ),
      ),
      )
    ],
  );
}