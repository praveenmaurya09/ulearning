// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ulearning/common/values/colors.dart';
//
// AppBar buildAppBar() {
//   return AppBar(
//     centerTitle: true,
//     title: Text(
//       "Log In",
//       style: TextStyle(
//         color: AppColors.primaryText,
//         fontSize: 18.sp,
//         fontWeight: FontWeight.normal,
//       ),
//     ),
//     bottom: PreferredSize(
//       preferredSize: const Size.fromHeight(1.0),
//       child: Container(
//         color: AppColors.primarySecondaryBackground,
//         // height defines the thickness of line
//         height: 1.0,
//       ),
//     ),
//   );
// }
//
// // We need context for accessing blocs
//
// Widget buildThirdPartyLogin(BuildContext context) {
//   return Container(
//     margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
//     padding: EdgeInsets.only(left: 25.w, right: 25.w),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         _reusableIcons("google"),
//         _reusableIcons("apple"),
//         _reusableIcons("facebook"),
//       ],
//     ),
//   );
// }
//
// // Reusable Icons
//
// Widget _reusableIcons(String iconName) {
//   return GestureDetector(
//       onTap: () {},
//       child: SizedBox(
//         width: 40.w,
//         height: 40.w,
//         child: Image.asset("assets/icons/$iconName.png"),
//       ));
// }
//
// Widget reusableText(String text) {
//   return Container(
//     margin: EdgeInsets.only(bottom: 5.h),
//     child: Text(
//       text,
//       style: TextStyle(
//           color: AppColors.primarySecondElementText,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.normal,),
//     ),
//   );
// }
//
// Widget buildTextField(String hintText, String textType, String iconName,
//     void Function(String value)? func) {
//   return Container(
//     width: 325.w,
//     height: 50.h,
//     margin: EdgeInsets.only(bottom: 20.h),
//     decoration: BoxDecoration(
//       color: AppColors.primaryBackground,
//       borderRadius: BorderRadius.all(
//         Radius.circular(15.w),
//       ),
//       border: Border.all(
//         color: AppColors.primaryText,
//       ),
//     ),
//     child: Row(
//       children: [
//         Container(
//           width: 16.w,
//           height: 16.w,
//           margin: EdgeInsets.only(left: 10.w),
//           child: Image.asset("assets/icons/$iconName.png"),
//         ),
//         SizedBox(
//           width: 270.w,
//           height: 50.h,
//           child: TextField(
//             onChanged: (value) => func!(value),
//             keyboardType: TextInputType.multiline,
//             decoration: InputDecoration(
//               hintText: hintText,
//               hintStyle: const TextStyle(
//                 color: AppColors.primarySecondElementText,
//               ),
//               border: const OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.transparent),
//               ),
//               enabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.transparent),
//               ),
//               disabledBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.transparent),
//               ),
//               focusedBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: AppColors.transparent),
//               ),
//             ),
//             style: TextStyle(
//                 color: AppColors.primaryText,
//                 fontFamily: "Avenir",
//                 fontWeight: FontWeight.normal,
//                 fontSize: 14.sp),
//             autocorrect: false,
//             obscureText: textType == "password" ? true : false,
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget forgetPassword() {
//   return Container(
//     width: 260.w,
//     height: 45.h,
//     margin: EdgeInsets.only(left: 25.w),
//     child: GestureDetector(
//       onTap: () {},
//       child: Text(
//         "Forget Password?",
//         style: TextStyle(
//             color: AppColors.primaryText,
//             decorationColor: AppColors.primaryText,
//             decoration: TextDecoration.underline,
//             fontSize: 12.sp),
//       ),
//     ),
//   );
// }
//
// Widget buildLogInAndRegButton(String buttonName, String buttonType,
//     void Function()? func) {
//   return GestureDetector(
//     onTap: func,
//     child: Container(
//       width: 325.w,
//       height: 50.h,
//       margin: EdgeInsets.only(top: 25.h, left: 25.w, right: 25.w),
//       decoration: BoxDecoration(
//         // check for Button Color
//         color: buttonType == "login" ? AppColors.primaryElement : AppColors.primaryBackground,
//         borderRadius: BorderRadius.all(
//           Radius.circular(15.w),
//         ),
//         border: Border.all(
//           // check for Button Border
//           color: buttonType == "login" ? AppColors.transparent :AppColors.primaryBorder
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: AppColors.primarySecondaryBackground,
//             spreadRadius: 1,
//             blurRadius: 2,
//             offset: Offset(0, 1),
//           ),
//         ],
//       ),
//       child: Center(
//         child: Text(
//           buttonName,
//           style: TextStyle(
//             // check for Button Text Color
//             color: buttonType == "login" ? AppColors.primaryElementText : AppColors.primaryText,
//             fontSize: 20.sp,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//       ),
//     ),
//   );
// }
