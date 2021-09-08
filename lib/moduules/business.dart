import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/componants/componants.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list =NewsCubit.get(context).business;
          return (list.length>0)
              ? ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      buildArticleItem(list[index],context),
                  itemCount: list.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Padding(
                    padding: EdgeInsets.all(20),
                    child: Divider(thickness: 1.5,),
                  ),
            physics: BouncingScrollPhysics(),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
