import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning/pages/home/bloc/home_page_states.dart';
import 'package:ulearning/pages/home/widgets/home_page_widgest_two.dart';

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
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child:
                          homePageText("Hello,", color: AppColors.primaryThirdElementText, top: 10),
                    ),
                    SliverToBoxAdapter(
                      child: homePageText("Raju",  top: 5),
                    ),
                    SliverPadding(padding: EdgeInsets.only(top: 15.h),),
                    SliverToBoxAdapter(
                      child: searchView(),
                    ),
                    SliverToBoxAdapter(
                      child: slidersView(context, state),
                    ),
                    SliverToBoxAdapter(
                      child: menuView(),
                    ),
                    SliverPadding(padding: EdgeInsets.symmetric(vertical:15.h, horizontal: 0.w),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.6,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: 4,
                          (BuildContext context, int index){
                            return GestureDetector(
                              onTap: (){},
                              child: courseGrid(),
                            );
                          }
                      ),
                    ),
                    ),

                  ],
                )
              );
            }
          ),
    ));
  }
}


