import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';




void NavigatTo(context,Widget Screen){
 Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) =>Screen));
}
void NavigatToScreen(context,Widget Screen){
 Navigator.of(context).push( MaterialPageRoute(builder: (context) =>Screen));
}

 Widget header(context) {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credential to login"),
      ],
    );
  }
  Widget forgotPassword({required void Function()? onPressed}) {
    return TextButton(
      onPressed:onPressed,
      child: const Text("Forgot password?",
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }

  Widget signup({required void Function()? onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? "),
        TextButton(
            onPressed: onPressed,
            child: const Text("Sign Up", style: TextStyle(color: Colors.black),)
        )
      ],
    );
  }

  Widget TextFormFieldreusable(
        {
TextEditingController? controller,
String ?text,Icon? prefixIcon,
IconButton? suffixIcon,
TextInputType? passtype,
bool x=true,
required FormFieldValidator validate,
 } 
  ){
return   TextFormField(
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

Widget ElevatedButtonreusable({
   required Function onPressed,
   Color color=Colors.blue,
   String? text,
}){return Container(
  decoration:
  BoxDecoration(color: Colors.black,
  borderRadius: BorderRadius.circular(18),),
  child: ElevatedButton(
              onPressed: (){onPressed!();},
              child: Text(
                "${text}",
                style: TextStyle(fontSize: 20,color: Colors.black),
              ),
            ),
);} 

void Showtoast({String? msg}){

Fluttertoast.showToast(
  msg:msg!,
  toastLength: Toast.LENGTH_LONG,
  gravity:ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: Colors.green,
  textColor: Colors.black);


}