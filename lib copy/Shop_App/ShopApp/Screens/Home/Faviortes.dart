import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Modles/favmodelget.dart';
import '../../cubits/ShopAppClassStatus.dart';
import '../../cubits/shopAppCubit.dart';
class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppCubit,ShopStates>(
    builder:(context, state) {return
     ConditionalBuilder(
          condition:state is! Loadingfavorites,
          builder: (context) {
            return buildproductes(ShopAppCubit.get(context).GetFavoritmodle!,context);
          },
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        ); }, listener:(context, state) {
      
    },);
  }
}
Widget buildproductes(Favoritmodel model,context) {
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
            mainAxisSpacing: 11,
            crossAxisSpacing: 5,
            childAspectRatio: 1 / 1.8,
            children: List.generate(model.data!.data.length,
                (index) => builditemproductes(model.data!.data[index],context)),
          ),
        )
      ],
    ),
  );
}

Widget builditemproductes(favoritesdata model,context) {
  return Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
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
                    image: NetworkImage('${model.product!.image}'),
                    width: double.infinity,
                    height: 200,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      '${model.product!.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, height: 1.4),
                    ),
                    Row(children: [
                      Text(
                        '${model.product!.price.round()}' + ' \$',
                        style: TextStyle(
                            fontSize: 12, height: 1.4, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (model.product!.discount != 0)
                        Text(
                          '${model.product!.oldPrice.round()}',
                          style: TextStyle(
                              fontSize: 12,
                              height: 1.4,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
ShopAppCubit.get(context).ChangFavorites(productid: model.product!.id!);
                          },
                          icon: CircleAvatar(
                            backgroundColor:ShopAppCubit.get(context).favoriteid[model.product!.id]!?Color.fromARGB(88, 123, 123, 238):const Color.fromARGB(255, 192, 185, 185),
                            child: Icon(
                              Icons.favorite_border,
                              size: 20,
                            ),
                          ))
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
