import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Endpoints.dart';
import '../../../shardtool.dart';
import '../../ClassesHelper/CashMemmory.dart';
import '../../ClassesHelper/DioHelper.dart';
import '../Modles/Modellogin.dart';
import '../Screens/Home/Home.dart';
import 'LoginClassStatus copy.dart';




class LoginCubit extends Cubit<LoginStates> {
LoginCubit(super.initialState);

 
static LoginCubit get(context) => BlocProvider.of(context);

late userlogin loagindata;
void Userlogin({
required String email,
required String password,
var context}){
emit(LoadingnitialState());
DioHelper.postdata(url:'login',
 data: {'email':email,'password':password}).then((value){
 loagindata=userlogin.fromJson(value.data);
CashMemmory.SaveDate(key:'token', value:loagindata.data!.token.toString()).then((value){
tokenfromshard=loagindata.data!.token;
  }).catchError((e){
print(e.toString());

  });

 print(tokenfromshard);
print(loagindata.message.toString());

//CashMemmory.SaveDate(key:'token', value: loagindata.data!.token.toString());
  emit(LOginSuccsessState());
  print("the value of api");
  //print(value.data.toString());
}).catchError((error){
  emit(LOginErorrState(error.toString()));
  print('the error are');
  print(error.toString());});
}
bool isDark=true;
void changemod({ bool? fromshard}){
if(fromshard !=null)
isDark=fromshard;
else
isDark=!isDark;
isDark=!isDark;
CashMemmory.SaveDate(key:'isDark', value:isDark).then((value){
});
emit(cashSuccsessState());
}


IconData suffix=Icons.visibility_outlined;
bool ispassword=true;
void changesuffix(){
ispassword=!ispassword;
suffix=ispassword?Icons.visibility:Icons.visibility_off_outlined;
emit(Ispassword());
}

bool onbording=false;
void changemodonbording({ bool? fromshard}){
if(fromshard !=null)
onbording=!onbording;
CashMemmory.SaveDate(key:'onbording', value:onbording).then((value){
});
emit(cashSuccsessState());
}


}