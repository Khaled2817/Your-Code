import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/TaskCubit.dart';
import '../Cubits/TaskStates.dart';
class HomeTaskApp extends StatelessWidget {
  const HomeTaskApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit,TaskStates>(builder:(context, state) {
      return Scaffold(
       appBar: AppBar(title: Text("Social_App"),actions: [IconButton(onPressed: (){}, icon:Icon(Icons.search))],),
       body:TaskCubit.get(context).Screens[TaskCubit.get(context).curruntIndex],
       bottomNavigationBar: Container(
        decoration: BoxDecoration(
      
      borderRadius: const BorderRadius.all(Radius.circular(24)),
  
    ),
         child: BottomNavigationBar(
                elevation:10,
                onTap: (index){
                  TaskCubit.get(context).Changenavbar(index);
                },
                currentIndex: TaskCubit.get(context).curruntIndex,
                // ignore: prefer_const_literals_to_create_immutables
                items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat"),
                BottomNavigationBarItem(icon: Icon(Icons.post_add),label: "Post"),
                BottomNavigationBarItem(icon: Icon(Icons.person),label: "Users"),
                // BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings")
                ],
               ),
       )
      );
    }, listener:(context, state) {
      
    },);
  }
}