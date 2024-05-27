import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shardtool.dart';
import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';
import 'SearchScreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopStates>(
      
    builder:(context, state) {
      var cubit=ShopAppCubit.get(context);
      
      return Scaffold(
        appBar: AppBar(),
             body:cubit.Screens[cubit.curruntIndex] ,
            bottomNavigationBar: BottomNavigationBar(
              elevation:10,
              onTap: (index){
                cubit.Changenavbar(index);
              },
              currentIndex: cubit.curruntIndex,
              items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "الرئيسية"),
              BottomNavigationBarItem(icon: Icon(Icons.shop),label: "طلباتي"),
              BottomNavigationBarItem(icon: Icon(Icons.chat),label: "الدردشة"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "حسابي"),
              ]
              
              ,
             ),

    );}, listener:(context, state) {
      
    },);
  }
}