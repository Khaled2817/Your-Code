class UserModel{
String? name;
String? email;
String? phon;
String? uid;
bool ? IsEmailvarfied;
UserModel({this.email,this.name,this.phon,this.uid,this.IsEmailvarfied});
UserModel.fromJson(Map<String,dynamic>josn){
name=josn['name'];
email=josn['email'];
phon=josn['phon'];
uid=josn['uid'];
IsEmailvarfied=josn['IsEmailvarfied'];
}

Map<String,dynamic>toMap(){
return {
'name':name,
'email':email,
'phon':phon,
'uid':uid,
'IsEmailvarfied':IsEmailvarfied
};

}

}