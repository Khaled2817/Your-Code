import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';

class Googelmap extends StatelessWidget {
   Googelmap({this.text});
String? text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopStates>(
    builder:(context, state)  {return Scaffold(
    appBar:AppBar(title: (Text("Google Map for App")),),
    body:  
    Column(
      children: <Widget>[Container(
        child: Expanded(
          child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.42796133580664, -122.085749655962),
                    zoom: 14.4746,
                  ),
                ),
              
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${text}',style:TextStyle(fontSize: 20) ,),
      ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(child:ElevatedButton(child:Text('حفظ المواقع',style:TextStyle(fontSize: 20) ,) ,onPressed: (){},)),
        )], 
    ),
      );
          }, listener:(context, state) {
      
    },);
  }
}