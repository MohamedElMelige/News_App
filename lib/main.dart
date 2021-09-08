import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:untitled1/shared/bloc_observer.dart';
import 'package:untitled1/shared/constant.dart';
import 'package:untitled1/shared/network/remot/dio_helper.dart';

import 'layout/home_layout.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode:ThemeMode.dark,
      darkTheme: ThemeData(
        textTheme:TextTheme(bodyText1: TextStyle(
          fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white
        )),
        dividerColor: Colors.white,
       scaffoldBackgroundColor: HexColor('333739'),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
              color: Colors.white,
          ),
          titleSpacing: 20,
          color: HexColor('333739'),
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: HexColor('333739'),statusBarIconBrightness: Brightness.light),
          backwardsCompatibility: false,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            elevation: 30,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            backgroundColor: HexColor('333739'),
        ),
      ),
      theme: ThemeData(
        textTheme:TextTheme(bodyText1: TextStyle(
            fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black
        )),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          titleSpacing: 20,
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
          backwardsCompatibility: false,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            elevation: 30,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey),
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
