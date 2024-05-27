import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../SocialCubits/cubits/CubitSocialAll.dart';
import '../SocialCubits/cubits/StatsForAll.dart';
class HomeSocialApp extends StatelessWidget {
  const HomeSocialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubitAll,SocialAppStateStateAll>(builder:(context, state) {
      return Scaffold(
       appBar: AppBar(title: Text("Social_App"),),
       body:SocialCubitAll.get(context).Screens[SocialCubitAll.get(context).curruntIndex],
       bottomNavigationBar: BottomNavigationBar(
              elevation:10,
              onTap: (index){
                SocialCubitAll.get(context).Changenavbar(index);
              },
              currentIndex: SocialCubitAll.get(context).curruntIndex,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.chat),label: "Chat"),
              BottomNavigationBarItem(icon: Icon(Icons.post_add),label: "Post"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Users"),
              BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings")
              ]
             )
      );
    }, listener:(context, state) {
      
    },);
  }
}