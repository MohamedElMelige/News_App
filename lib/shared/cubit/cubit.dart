import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/moduules/business.dart';
import 'package:untitled1/moduules/science.dart';
import 'package:untitled1/moduules/sports.dart';
import 'package:untitled1/shared/cubit/states.dart';
import 'package:untitled1/shared/network/remot/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitalState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
  ];
  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  void changeBottomeNavBar(int index) {
    currentIndex = index;
    if (index == 1)
      getSport();
    if(index == 2)
      getScience();
    emit(NewsBottomNavState());
  }

  void getBusiness() {
    emit(LoadingBusinessState());
    if (business.length == 0) {
      DioHelper.getDio(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        print(value.data['totalResults']);
        business = value.data['articles'];
        print(business[0]['title']);
        emit(GetBusinessDataState());
      }).catchError((error) {
        print('Error is${error.toString()}');
        emit(BusinessErrorState(error.toString()));
      });
    }else
      emit(GetBusinessDataState());
  }
  void getSport() {
    emit(LoadingSportsState());
    if(sports.length ==0){
      DioHelper.getDio(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        print(value.data['totalResults']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(GetSportsDataState());
      }).catchError((error) {
        print('Error is${error.toString()}');
        emit(SportsErrorState(error.toString()));
      });
    }else
      emit(GetSportsDataState());
  }
  void getScience() {
    emit(LoadingScienceState());
    if (science.length == 0) {
      DioHelper.getDio(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      }).then((value) {
        print(value.data['totalResults']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(GetScienceDataState());
      }).catchError((error) {
        print('Error is${error.toString()}');
        emit(ScienceErrorState(error.toString()));
      });
    }else
      emit(GetScienceDataState());
  }
}
