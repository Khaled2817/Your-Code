// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Endpoints.dart';
import '../Shop_App/ClassesHelper/CashMemmory.dart';
import '../Shop_App/bloc_obsorv/bloc_obsorv.dart';
import 'SocialCubits/cubits/CubitSocialAll.dart';
import 'SocialCubits/cubits/SocialAppCubit.dart';
import 'SocialCubits/cubits/SocialAppStates.dart';
import 'SocialCubits/cubits/StatsForAll.dart';
import 'Social_layout/SocialHome.dart';
import 'Social_layout/SocialLogin.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
   await CashMemmory.init();
     await Firebase.initializeApp(
  options: FirebaseOptions(
    apiKey: 'AIzaSyCXVz1tGdKanYPrr1w9n4hjC8nSa_UXbVo',
    appId: '1:892060837058:android:bed27be5bff923ff01c75b',
    messagingSenderId: '892060837058',
    projectId: 'social-app-7b0cb',
   // storageBucket: 'myapp-b9yt18.appspot.com',
  )
);
Widget staetScreen;
 uID=CashMemmory.getData(key: 'Id');
if(uID!=null){
staetScreen=LoginSocialApp();
}else{
staetScreen=HomeSocialApp();
}
print("khaled id = "+"$uID");
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
            create: (context) => SocialCubitAll(SocialinitialStateAll())..getUser(),
          ),
           BlocProvider(
            create: (context) => SocialAppCubit(SocialinitialState()),
          )
        ],
        child: BlocConsumer<SocialCubitAll,SocialAppStateStateAll>(
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
                home:LoginSocialApp());
          },
        ));
  }
}
