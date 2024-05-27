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
        appBar: AppBar(title:Text("Salles"),actions: [

          IconButton(onPressed: (){
NavigatToScreen(context,SearshScreen());
            
          }, icon:Icon(Icons.search))
        ],),
             body:cubit.Screens[cubit.curruntIndex] ,
            bottomNavigationBar: BottomNavigationBar(
              elevation:10,
              onTap: (index){
                cubit.Changenavbar(index);
              },
              currentIndex: cubit.curruntIndex,
              items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.apps),label: "Catigors"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Favorites"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings")
              ]
              
              ,
             ),

    );}, listener:(context, state) {
      
    },);
  }
}