import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';

import 'package:ulearning/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: BlocBuilder<HomePageBlocs, HomePageStates>(
            builder: (context, state){
              return  Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homePageText("Hello,", color: AppColors.primaryThirdElementText, top: 10),
                    homePageText("Raju",  top: 5),
                    SizedBox(height: 20.h,),
                    searchView(),
                    slidersView(context, state),
                  ],
                ),
              );
            }
          ),
    ));
  }
}


