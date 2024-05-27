import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Endpoints.dart';
import '../../../Shop_App/ShopApp/Screens/onbordingScreen/Onbordingclass.dart';
import '../../../shardtool.dart';
import '../../SocialModles.dart/UserModel.dart';
import 'SocialAppStates.dart';

class SocialAppCubit extends Cubit<SocialAppStateState> {
SocialAppCubit(super.initialState);

 
static SocialAppCubit get(context) => BlocProvider.of(context);






List<Bordingview> bording=[
// Bordingview(body:'Nice day for shopping',image:'assets/1.jpg',title:'More of Items'),
// Bordingview(body:'Make you life more smart',image:'assets/2.jpg',title:'Change Your look'),
// Bordingview(body:'Good luck with the best Discount',image:'assets/3.jpg',title:'The Best Price'),
];



IconData suffix=Icons.visibility_outlined;
bool ispassword=true;
void changesuffix(){
ispassword=!ispassword;
suffix=ispassword?Icons.visibility:Icons.visibility_off_outlined;
emit(IspasswordSocial());
}

void Registeer({
  required String name,
  required String phone,
  required String email,
  required String password}){
emit(loadingCreateSocialAppStateState());
   FirebaseAuth.instance.
   createUserWithEmailAndPassword(
    email: email,
     password: password)
     .then((value){
      print(value.user!.email.toString());
      print(value.user!.uid.toString());
      uID=value.user!.uid.toString();
      CreateUser(email:email ,phone:phone ,uid:value.user!.uid,name:name);
Showtoast(msg: "تم التسجيل بنجاح");
     })
     .catchError((e){
print(e.toString());
      emit(RegisteerSocilaErorr());
     });
}
//-------------------------------------------------------------------------------------
void LoginSocial({
  required String email,
  required String password}){
    emit(loadingSocialAppStateState());
   FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
     password: password)
     .then((value){
      print(value.user!.email.toString());
      print(value.user!.uid.toString());
emit(LoginSocilaSuccess(Id:value.user!.uid));
Showtoast(msg: "تم التسجيل بنجاح");
     })
     .catchError((e){
print(e.toString());
      emit(LoginSocilaErorr());
     });
}
//----------------------------------------------------------------------------------------
void CreateUser({
  required String name,
  required String phone,
  required String email,
  required String uid,
}){

UserModel model=UserModel(name:name ,phon:phone ,uid:uid ,email:email,IsEmailvarfied: false);
FirebaseFirestore.instance.collection("Users").doc(uid).set(model.toMap()).
then((value){
  emit(RegisteerSocilaSuccess());
}).catchError((e){
  emit(ErorrCreateSocilaSuccess());
});
}

}

