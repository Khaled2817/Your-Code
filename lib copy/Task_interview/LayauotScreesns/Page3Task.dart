// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubits/TaskCubit.dart';
import '../Cubits/TaskStates.dart';
class Page3Screen extends StatelessWidget {
  const Page3Screen({super.key});

  @override
  Widget build(BuildContext context) {
  


    return BlocProvider(
      create: (BuildContext) => TaskCubit(TaskInitionalState()),
      child: BlocConsumer<TaskCubit, TaskStates>(
        builder: (context, state) {
          return Scaffold(
            body: Center(child: Text("Page3"),)
          );
        },
        listener: (context, state) {
           
        },
      ),
    );
  }
}
