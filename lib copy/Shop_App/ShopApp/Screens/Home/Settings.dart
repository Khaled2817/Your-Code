import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shardtool.dart';
import '../../../ClassesHelper/CashMemmory.dart';
import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';
import '../AuthSreens/login.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
   return BlocConsumer<ShopAppCubit,ShopStates>(builder: (context,state) {
    
    return Scaffold(
    body: ConditionalBuilder(
          condition: ShopAppCubit.get(context).homeModel != null,
          builder: (context) {
            return Fromm(context);
          },
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        ),
   );  },listener: (context, state) {
     
   },);
  }
}
Widget TextFormField(
{TextEditingController? controller, String ?text,Icon? prefixIcon}
){


return TextField(
  controller:controller,
  decoration: InputDecoration(
    prefixIcon:prefixIcon,
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    labelText: '${text}',
   // hintText: 'Enter your username',
  ),
);
 

}

Widget Fromm(context){
TextEditingController NameUserProfile = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController PhonNumber = TextEditingController();
NameUserProfile.text=ShopAppCubit.get(context).userprofile!.data!.name.toString();
emailController.text=ShopAppCubit.get(context).userprofile!.data!.email.toString();
PhonNumber.text=ShopAppCubit.get(context).userprofile!.data!.phone.toString();
return  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          TextFormField(controller:NameUserProfile,text:"Username" ,prefixIcon: Icon(Icons.person)),
          SizedBox(height: 10,),
          TextFormField(controller:emailController ,text:"Email",prefixIcon: Icon(Icons.email)),
          SizedBox(height: 10,),
          TextFormField(controller:PhonNumber ,text:"Phone",prefixIcon: Icon(Icons.phone)),
          SizedBox(height: 10,),
          ElevatedButtonreusable(onPressed:(){
          CashMemmory.RemovData(key:'token' );
          NavigatTo(context,LoginShopApp());
          },text: "Log Out"),
          ],),
);


}