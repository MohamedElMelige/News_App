import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/constant.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  static bool toglle =true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'News App',
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        if (toglle) {
                          toglle =false;
                          
                        }  else{
                          toglle=true;
                        }
            },
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.brightness_4_outlined,
                        size: 30,
                      ))
                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    cubit.changeBottomeNavBar(index);
                  },
                  items: cubit.bottomItems),
            );
          }),
    );
  }
}
