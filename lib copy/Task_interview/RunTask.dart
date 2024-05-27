// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Shop_App/ClassesHelper/CashMemmory.dart';
import '../Shop_App/ClassesHelper/DioHelper.dart';
import '../Shop_App/bloc_obsorv/bloc_obsorv.dart';
import 'LayauotScreesns/HometaskScreen.dart';
import 'LayauotScreesns/LoginTask.dart';
import 'Cubits/TaskCubit.dart';
import 'Cubits/TaskStates.dart';
import 'listvedio.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CashMemmory.init();
  Bloc.observer = Myblocstates();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
 Widget? widget;
 MyApp({this.widget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
           BlocProvider(
            create: (context) => TaskCubit(TaskInitionalState()),
          ),
          
        ],
        child: BlocConsumer<TaskCubit,TaskStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  
             type:BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            elevation:50.0,
            backgroundColor: Colors.white
            
           )),
                debugShowCheckedModeBanner: false,
                home:HomeTaskApp());
          },
        ));
  }
}
