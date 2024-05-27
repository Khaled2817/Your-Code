// ignore_for_file: prefer_const_constructors


import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../shardtool.dart';
import '../../Modles/TaskModel.dart';
import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';
import 'GoogleMap.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit, ShopStates>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopAppCubit.get(context).postTaskModel != null,
          builder: (context) {
            return buildproductes(ShopAppCubit.get(context).postTaskModel!,context);
          },
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      listener: (context, state) {


      },
    );
  }
}

Widget buildproductes(TaskModel model,context) {
  return Scaffold(

    body:SingleChildScrollView(
      child: Column(children:<Widget> [
        
        Row(children: <Widget>[IconButton(onPressed: (){}, icon:Icon(Icons.list),
        ),
        IconButton(onPressed: (){}, icon:Icon(Icons.notification_add,color: Colors.green,)),
        Expanded(
          child: InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 78, 75, 75),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 5.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ]),
              child: TextField (
                
                decoration: InputDecoration(  
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none,  
                  labelText: 'Search..........',  
                  hintText: 'what Search'  
                ),  
              ),
            ),
          ),
        )],),
        CarouselSlider(
            items: model.data!
                .map((e) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 78, 75, 75),
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 5.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ]),
                        child: Image(
                          image: NetworkImage('${e.image}'),
                          width: double.infinity,
                          fit: BoxFit.cover,
                         
                        ),  
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 2),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            )),

Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: 
[Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text("الفئـــات",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
)],),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[twoRow(text:'المصنعون' ,icon:Icons.person),twoRow(text: 'المنتجين',icon: Icons.factory),twoRow(text: 'الجملة',icon:Icons.production_quantity_limits ),],),
            ),
              SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[twoRow(text:'اخري',icon: Icons.devices_other ),twoRow(text: 'الموزعين',icon:Icons.person_4_rounded),twoRow(text: 'الوكلاء',icon:Icons.person_2_outlined),],),
            ),
            Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: 
[Padding(
  padding: const EdgeInsets.all(8.0),
  child: Text("المطاعم الايطالية",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
)],),
         SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 11,
                crossAxisSpacing: 5,
                childAspectRatio: 1 /1.5,
                children: List.generate(4,
                    (index) => builditemproductes(model.data![index],context)),
              ),
            )
          ],
        ),
      ),],),
    )
  );
}

Widget builditemproductes(DataTask model,context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
           NavigatToScreen(context,Googelmap(text: model.address,));
          },
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 78, 75, 75),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 5.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image(
                        image: NetworkImage('${model.image}'),
                        width: double.infinity,
                        height: 200,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        Text(
                          '${model.name}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, height: 1.4),
                        ),
                      
                      ],
                    ),
                  ),
                  Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      children: [
                        Text(
                          'العنوان :${model.address}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15, height: 1.4),
                        ),
                      
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      )
    ],
  );
}
Widget twoRow({String? text,IconData? icon}){


return Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    height: 100,
    width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 78, 75, 75),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 5.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,color:Colors.deepOrangeAccent,size:30,),
                Text(
                          '${text}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, height: 1.4,fontWeight: FontWeight.bold),
                        ),
                ],
              ),
            ),
);

}