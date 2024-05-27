// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Endpoints.dart';
import 'Shop_App/ClassesHelper/CashMemmory.dart';
import 'Shop_App/ClassesHelper/DioHelper.dart';
import 'Shop_App/ShopApp/Screens/AuthSreens/login.dart';
import 'Shop_App/ShopApp/Screens/Home/Home.dart';
import 'Shop_App/ShopApp/Screens/onbordingScreen/OnpordingScreen.dart';
import 'Shop_App/ShopApp/cubits/LoginClassStatus copy.dart';
import 'Shop_App/ShopApp/cubits/LoginCubit.dart';
import 'Shop_App/ShopApp/cubits/ShopAppClassStatus.dart';
import 'Shop_App/ShopApp/cubits/shopAppCubit.dart';
import 'Shop_App/bloc_obsorv/bloc_obsorv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Myblocstates();
  await DioHelper.init();
  await CashMemmory.init();
  bool? isDark = CashMemmory.getData(key: 'isDark');
  bool? onbording = CashMemmory.getData(key: 'onbording');
  tokenfromshard = CashMemmory.getData(key: 'token');
  Widget? screen;
  print('token of user = +${tokenfromshard}+$onbording');
  
  if(onbording!=null){
  if(tokenfromshard!=null){screen=Home();}else{ screen=LoginShopApp();}
  }else{
  screen=Onbording();
  }
runApp(MyApp(isDark: isDark, widget: screen,));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  bool? isDark;
  Widget? widget;
  MyApp({required this.isDark,required this.widget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ShopAppCubit(shopinitialState())..changemod(valuefromShard: isDark)
                ..getHomedat()
                ..getcatigories()
                ..getFavorites()
                ..UserProfile(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(LOgininitialState()),
          )
        ],
        child: BlocConsumer<ShopAppCubit, ShopStates>(
          listener: (context, state) => {},
          builder: (context, state) {
            return MaterialApp(
                theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
             type:BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            elevation:50.0,
            backgroundColor: Colors.white
            
           )),
                    
//____________________________________________________________
                darkTheme: ThemeData(
                    scaffoldBackgroundColor: Colors.black,
                    appBarTheme: AppBarTheme(backgroundColor: Colors.black),
                     bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type:BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            elevation:50.0,
            backgroundColor: Colors.black
           )),
                debugShowCheckedModeBanner: false,
                themeMode: ShopAppCubit.get(context).isDark
                    ? ThemeMode.light
                    : ThemeMode.dark,
                home:widget);
          },
        ));
  }
}
