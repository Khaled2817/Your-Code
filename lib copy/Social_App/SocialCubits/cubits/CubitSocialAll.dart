import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Endpoints.dart';
import '../../SocialModles.dart/UserModel.dart';
import '../../Social_layout/Chats.dart';
import '../../Social_layout/HomeSocial.dart';
import '../../Social_layout/SettingProfil.dart';
import '../../Social_layout/ThePostes.dart';
import '../../Social_layout/Users.dart';
import 'StatsForAll.dart';

class SocialCubitAll extends Cubit<SocialAppStateStateAll> {
SocialCubitAll(super.initialState);
static SocialCubitAll get(context) => BlocProvider.of(context);
UserModel? ModelGetUser;
void getUser(){
emit(GetUserSocialLoading());
FirebaseFirestore.instance.collection("Users").doc(uID).get().
then((value){
  print("khaled zaki");
  print(value.data().toString());
  emit(GetUserSocialSuccess());
})
.catchError((e){
emit(GetUserSocialErorr());
});
}
int curruntIndex=0;
List<Widget> Screens=[
HomeSocial(),
Chats(),
ThePost(),
Users(),
SettinProfile()
];
void Changenavbar(int index){
curruntIndex=index;
emit(ChangeNavBar());
}

//khaled zaki hanafy


}

