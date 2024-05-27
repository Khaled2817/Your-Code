import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../shardtool.dart';
import '../../../ClassesHelper/CashMemmory.dart';
import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';
import '../AuthSreens/login.dart';
import 'Onbordingclass.dart';



class Onbording extends StatelessWidget { // انت مسحت السوبر كلاس كونستركتور ال هنا
 
 var bordinControll= PageController(); 
 bool? ondbording =CashMemmory.getData(key:'onbording');
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<ShopAppCubit,ShopStates>(
  builder: (context, state) {return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
          Expanded(
            child: PageView.builder(
              onPageChanged:(int index){
        
        ShopAppCubit.get(context).changeSmooth(index);
        
        
              },
            controller:bordinControll,
            physics:BouncingScrollPhysics(),
            itemBuilder:(context, index) =>Builderitem(ShopAppCubit.get(context).bording[index]),
            itemCount: ShopAppCubit.get(context).bording.length,
            ),
          ),
          SizedBox(height: 10,),
          Row(children: <Widget>[
           SmoothPageIndicator(
             controller:bordinControll,
             count:ShopAppCubit.get(context).bording.length,
             effect:ExpandingDotsEffect(
              dotColor:Colors.grey), 
          ),
          Spacer(),
          FloatingActionButton(
            onPressed:(){
        
        if(ShopAppCubit.get(context).nextpage==true){
        NavigatTo(context,LoginShopApp());
        }else{bordinControll.nextPage(
          duration:Duration(milliseconds: 720,),
          curve:Curves.fastEaseInToSlowEaseOut);}
          ShopAppCubit.get(context).changemodpage(valuefromShard:ondbording);
          print(ShopAppCubit.get(context).onbording);
            },
            child: Icon(Icons.arrow_forward_ios))],),
            
          
          ],
        ),
      ),
     
      );},listener: (context, state) {},
    );
  }

Widget Builderitem(Bordingview model)=>Column(children: <Widget>[
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 300,
            width: 300,
            child: Image(image: AssetImage('${model.image}'),fit:BoxFit.cover ,)
          ,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.black,
          width: 3.0,
        )
          
          ),),
        ),
        SizedBox(height: 20,),
        Text('${model.title}',style: TextStyle(fontSize: 20),),
        SizedBox(height: 20,),
        Text('${model.body}',style: TextStyle(fontSize: 10),)
        ],);

}