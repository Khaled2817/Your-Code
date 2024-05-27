import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Modles/CatigorsModle.dart';
import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';

class CatigorsScreen extends StatelessWidget {
  const CatigorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopStates>(
    builder:(context, state) {return
     ConditionalBuilder(
          condition: ShopAppCubit.get(context).catigoriesModle != null,
          builder: (context) {
            return buildproductes(ShopAppCubit.get(context).catigoriesModle!);
          },
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        ); }, listener:(context, state) {
      
    },);
  }
}
Widget buildproductes(CatigorsModle model) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
      
        Container(
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 5,
            childAspectRatio: 1 / 1.3,
            children: List.generate(model.data!.data.length,
                (index) => builditemproductes(model.data!.data[index])),
          ),
        )
      ],
    ),
  );
}

Widget builditemproductes(DateModel model) {
  return Column(
    children: <Widget>[
      InkWell(
        onTap: (){print("object");},
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
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration( color: Color.fromARGB(255, 38, 94, 122),borderRadius: BorderRadius.circular(10.0),),
                      width: double.infinity,
                      child: Text(
                        '${model.name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, height: 1.4,color: Color.fromARGB(255, 203, 202, 219)),
                      ),
                    ),
                    Row(children: [
                     
                      SizedBox(
                        width: 10,
                      ),
                    
                      Spacer(),
                     
                    ])
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
