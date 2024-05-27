import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';

class SearshScreen extends StatelessWidget {
  const SearshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopStates>(
    builder:(context, state)  {return Scaffold(
    appBar:AppBar(),
    body: Center(child: Text("khaled"),),);}, listener:(context, state) {
      
    },);
  }
}