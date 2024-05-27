import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../LayauotScreesns/Page1task.dart';
import '../LayauotScreesns/Page2Task.dart';
import '../LayauotScreesns/Page3Task.dart';
import '../LayauotScreesns/Page4task.dart';
import 'TaskStates.dart';

class TaskCubit extends Cubit<TaskStates> {
TaskCubit(super.initialState);

static TaskCubit get(context) => BlocProvider.of(context);

int curruntIndex=0;
List<Widget> Screens=[
// Page1Screen(),
Page2Screen(),
Page3Screen(),
Page4Screen(),
];
void Changenavbar(int index){
curruntIndex=index;
emit(ChangnavbarTask());
// khaled
}
IconData suffix=Icons.visibility_outlined;
bool ispassword=true;
void changesuffix(){
ispassword=!ispassword;
suffix=ispassword?Icons.visibility:Icons.visibility_off_outlined;
emit(ChangepassIcon());
}


// HomeModel? homeModel;
// Map <int,bool> favoriteid={};
// void getHomedat(){
// DioHelper.getData(url:HomeDate,token:tokenfromshard ).then((value){
// homeModel=HomeModel.fromJson(value.data);
// print(homeModel!.data!.products[1].inFavorites);
// homeModel!.data!.products.forEach((e){
// favoriteid.addAll({e.id!:e.inFavorites!});
// print(favoriteid);
// });
// emit(Scussecgetdata());
// Showtoast(msg: 'الداتا جات الداتا حضرت');
// }).catchError((e){
// Showtoast(msg: '${e.toString()}');
// emit(Errorgetdata());
// });
// }

}