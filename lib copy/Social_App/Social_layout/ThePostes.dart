import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../SocialCubits/cubits/CubitSocialAll.dart';
import '../SocialCubits/cubits/StatsForAll.dart';



class ThePost extends StatelessWidget {
  const ThePost({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubitAll,SocialAppStateStateAll>(builder:(context, state) {
      return Scaffold(

body: Center(child: Text("ThePost"),),


      );
    }, listener:(context, state) {
      
    },);
  }
}