import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Endpoints.dart';
import '../../../shardtool.dart';
import '../../ClassesHelper/CashMemmory.dart';
import '../../ClassesHelper/DioHelper.dart';
import '../Modles/CatigorsModle.dart';
import '../Modles/Favoritmodel.dart';
import '../Modles/HomeModle.dart';
import '../Modles/Modellogin.dart';
import '../Modles/TaskModel.dart';
import '../Modles/favmodelget.dart';
import '../Screens/Home/Catigors.dart';
import '../Screens/Home/Faviortes.dart';
import '../Screens/Home/Products.dart';
import '../Screens/Home/SearchScreen.dart';
import '../Screens/Home/Settings.dart';
import '../Screens/onbordingScreen/Onbordingclass.dart';
import 'ShopAppClassStatus.dart';

class ShopAppCubit extends Cubit<ShopStates> {
ShopAppCubit(super.initialState);

 
static ShopAppCubit get(context) => BlocProvider.of(context);

List<Bordingview> bording=[
Bordingview(body:'Nice day for shopping',image:'assets/1.jpg',title:'More of Items'),
Bordingview(body:'Make you life more smart',image:'assets/2.jpg',title:'Change Your look'),
Bordingview(body:'Good luck with the best Discount',image:'assets/3.jpg',title:'The Best Price'),
];

//___________________________________________
bool isDark=false;

void changemod({bool? valuefromShard}){
   // في دوست الزرار ذات نفسه انت مبتبعتش ال valuefromeshared  علشان كده مبيدخلش علي الشرط 
  if(valuefromShard!=null)
  isDark=valuefromShard;
  else
  isDark=!isDark;
CashMemmory.SaveDate(key:'isDark', value:isDark).then((value){
  emit(ChangeMode());
});


}
//___________________________________________
bool onbording=false;
void changemodpage({bool? valuefromShard}){ 
  if(valuefromShard!=null)
  onbording=valuefromShard;
  else
  onbording=!onbording;
  CashMemmory.SaveDate(key:'onbording', value:true);
emit(ChangeModepage());
}
//___________________________________________
bool? nextpage;
  void changeSmooth(int index){
if(index==bording.length-1){
  nextpage=true;
}else{
  nextpage=false;
}
emit(changesmooth());
print(nextpage);
  }
//___________________________________________

int curruntIndex=0;
List<Widget> Screens=[
TaskScreen(),
CatigorsScreen(),
FavoritScreen(),
SettingScreen(),
];
void Changenavbar(int index){
curruntIndex=index;
emit(ChangeNavBar());

}
//________________________________________________
HomeModel? homeModel;
Map <int,bool> favoriteid={};
void getHomedat(){
DioHelper.getData(url:HomeDate,token:tokenfromshard ).then((value){
homeModel=HomeModel.fromJson(value.data);
print(homeModel!.data!.products[1].inFavorites);
homeModel!.data!.products.forEach((e){
favoriteid.addAll({e.id!:e.inFavorites!});
print(favoriteid);
});
emit(Scussecgetdata());
Showtoast(msg: 'الداتا جات الداتا حضرت');
}).catchError((e){
Showtoast(msg: '${e.toString()}');
emit(Errorgetdata());
});
}
//________________________________________________
CatigorsModle? catigoriesModle;
void getcatigories(){
DioHelper.getData(url:Get_Categories).then((value){
catigoriesModle=CatigorsModle.fromJson(value.data);
emit(Scussecgetcatigoriesdata());
Showtoast(msg: 'الداتا جات الداتا حضرت');
}).catchError((e){
Showtoast(msg: '${e.toString()}');
emit(Errorgetcatigoriesdata());
});
}
//________________________________________________
Fav? favmodel;
Color? selection;
void ChangFavorites({required int productid}){
  favoriteid[productid] =! favoriteid[productid]!;
  emit(changefavoritecolor());
  DioHelper.postdata(
   url:Favorites,
   data: {'product_id':productid},
   token: tokenfromshard
   ).then((value){
favmodel=Fav.fromJson(value.data);
if(!favmodel!.status!){
   favoriteid[productid] =! favoriteid[productid]!;
}else{
  getFavorites();
  
}
print(value.data);
emit(ScussecgetFavoritesdata());
Showtoast(msg:favmodel!.message);
}).catchError((e){
Showtoast(msg: '${e.toString()}');
emit(ErrorgetFavoritesdata());
});
}
//________________________________________________
Favoritmodel ? GetFavoritmodle;
void getFavorites(){
  emit(Loadingfavorites());
DioHelper.getData(url:Favorites,token: tokenfromshard).then((value){
GetFavoritmodle=Favoritmodel.fromJson(value.data);
emit(ScussecgetFavoritesdataM());
print("حجم اليست موجود اهو ولا اي "+'${GetFavoritmodle!.data!.data.length}');
Showtoast(msg: 'الداتا جات الداتا حضرت');
}).catchError((e){
Showtoast(msg: '${e.toString()}');
emit(ErrorgetFavoritesdataM());
});
}
//________________________________________________
userlogin? userprofile;
void UserProfile(){
emit(LoadinggetUserProfile());
DioHelper.getData(
url:Profile,
token: tokenfromshard
).then((value){
userprofile=userlogin.fromJson(value.data);
print(userprofile!.data!.name.toString());
emit(ScussecgetUserProfile());
}).catchError((e){
Showtoast(msg:'${e.toString()}');
emit(ErrorgetUserProfile());
});
}
//--------------------------------------------------
IconData suffix=Icons.visibility_outlined;
bool ispassword=true;
void changesuffix(){
ispassword=!ispassword;
suffix=ispassword?Icons.visibility:Icons.visibility_off_outlined;
emit(Ispassword());
}
//....................................................
userlogin? Registermodel;
void Registeer({
  required String name,
  required String phone,
  required String email,
  required String password}){
  DioHelper.postdata(
   url:"register",
   data: {
    'name':name,
    'phone':phone,
    'email':email,
    'password':password,
   },
   ).then((value){
    Registermodel=userlogin.fromJson(value.data);
  Showtoast(msg:Registermodel!.message.toString());
  CashMemmory.SaveDate(key:'token', value:Registermodel!.data!.token.toString()).then((value){
tokenfromshard=Registermodel!.data!.token;
  }).catchError((e){
print(e.toString());

  });
emit(ScussecRegisterUserProfile());
Showtoast(msg:Registermodel!.message);
}).catchError((e){
Showtoast(msg: '${e.toString()}');
emit(ErorrRegisterUserProfile());
});
}

//------------------------------------------------------------------------------


TaskModel? postTaskModel;
void PostTaskApp({
var context}){
emit(LoadingTaskapp());
DioHelper.postdata(url:'guest/get_near_branches',
 data: {'lat':'0','lng':'0','page':'1'}).then((value){
  postTaskModel=TaskModel.fromJson(value.data);
  print(postTaskModel!.data![1].restaurant!.id);
  print(value.data);
  emit(ScussecTaskapp());
}).catchError((error){
  emit(ErorrTaskapp());
  print('the error are');
  print(error.toString());});
}

}

