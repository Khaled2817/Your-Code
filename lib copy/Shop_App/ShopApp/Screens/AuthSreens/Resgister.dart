import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shardtool.dart';
import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';
import 'login.dart';
import '../Home/Home.dart';
class Register extends StatelessWidget {
  const Register({super.key});

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
    if(state is ScussecRegisterUserProfile){
    NavigatTo(context,Home());
    }
     
   },);
  }
}
Widget TextFormmField(
{
  TextEditingController? controller,
 String ?text,Icon? prefixIcon,
 IconButton? suffixIcon,
  TextInputType? passtype,
  bool x=true,
  required FormFieldValidator validate,
 }
){


return TextFormField(
  obscureText: x,
  validator: validate,
  keyboardType:passtype ,
  controller:controller,
  decoration: InputDecoration(
    prefixIcon:prefixIcon,
    suffixIcon:suffixIcon,
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
   var formKey = GlobalKey<FormState>();
TextEditingController NameUserProfile = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController PhonNumber = TextEditingController();
TextEditingController passwordController = TextEditingController();
return  Padding(
  padding: const EdgeInsets.all(8.0),
  child: Form(
    key:formKey ,
    child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              header(context),
              SizedBox(height: 10,),
            TextFormmField(controller:NameUserProfile,text:"Username" ,
            prefixIcon: Icon(Icons.person),
            passtype:TextInputType.name,
            x: false,
             validate: (value) { if(value.toString().isEmpty)
             return "Please Enter your Name"; } ),
            SizedBox(height: 10,),
            TextFormmField(controller:emailController ,
            text:"Email",prefixIcon: Icon(Icons.email),
            passtype:TextInputType.emailAddress,
            x: false,
             validate: (value){ if(value.toString().isEmpty)
             return "Please Enter your Email"; }),
            SizedBox(height: 10,),
            TextFormmField(controller:PhonNumber ,
            text:"Phone",prefixIcon: Icon(Icons.phone)
            ,passtype:TextInputType.number,x: false, validate: (value) { if(value.toString().isEmpty)
             return "Please Enter your phone"; }),
            SizedBox(height: 10,),
            TextFormmField(controller:passwordController,
            text:"Password",
            x:ShopAppCubit.get(context).ispassword ,
            passtype:TextInputType.visiblePassword,
            prefixIcon:Icon(Icons.password)
            ,suffixIcon:IconButton(onPressed: (){
             ShopAppCubit.get(context).changesuffix();
            }, icon:(Icon(ShopAppCubit.get(context).suffix))), validate: (value) { if(value.toString().isEmpty)
             return "Password is very short"; } ),
             SizedBox(height: 10,),
            ElevatedButtonreusable(onPressed:(){
             if(formKey.currentState!.validate()){
                  ShopAppCubit.get(context).Registeer(name:NameUserProfile.text ,
                   phone:PhonNumber.text, email: emailController.text,
                    password:passwordController.text );
                                 }
            },text: "Sing Up"),
            ],),
  ),
);


}