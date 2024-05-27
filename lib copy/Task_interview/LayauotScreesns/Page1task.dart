// // ignore_for_file: prefer_const_constructors

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../Shop_App/ShopApp/Modles/HomeModle.dart';
// import '../Cubits/TaskCubit.dart';
// import '../Cubits/TaskStates.dart';
// class ProductScreen extends StatelessWidget {
//   const ProductScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<TaskCubit, TaskStates>(
//       builder: (context, state) {
//         return ConditionalBuilder(
//           condition: TaskCubit.get(context).homeModel != null,
//           builder: (context) {
//             return buildproductes(TaskCubit.get(context).homeModel!,context);
//           },
//           fallback: (context) => Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//       listener: (context, state) {


//       },
//     );
//   }
// }

// Widget buildproductes(HomeModel model,context) {
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Column(
//       children: <Widget>[
//         CarouselSlider(
//             items: model.data!.banners
//                 .map((e) => Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             // ignore: prefer_const_literals_to_create_immutables
//                             boxShadow: [
//                               BoxShadow(
//                                 color: const Color.fromARGB(255, 78, 75, 75),
//                                 offset: const Offset(
//                                   5.0,
//                                   5.0,
//                                 ),
//                                 blurRadius: 5.0,
//                               ), //BoxShadow
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: const Offset(0.0, 0.0),
//                                 blurRadius: 0.0,
//                                 spreadRadius: 0.0,
//                               ), //BoxShadow
//                             ]),
//                         child: Image(
//                           image: NetworkImage('${e.image}'),
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ))
//                 .toList(),
//             options: CarouselOptions(
//               height: 200,
//               initialPage: 0,
//               enableInfiniteScroll: true,
//               reverse: false,
//               viewportFraction: 1.0,
//               autoPlay: true,
//               autoPlayInterval: Duration(seconds: 3),
//               autoPlayAnimationDuration: Duration(seconds: 2),
//               autoPlayCurve: Curves.fastOutSlowIn,
//               scrollDirection: Axis.horizontal,
//             )),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           child: GridView.count(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             crossAxisCount: 2,
//             mainAxisSpacing: 11,
//             crossAxisSpacing: 5,
//             childAspectRatio: 1 / 1.8,
//             children: List.generate(model.data!.products.length,
//                 (index) => builditemproductes(model.data!.products[index],context)),
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget builditemproductes(Products model,context) {
//   return Column(
//     children: <Widget>[
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               // ignore: prefer_const_literals_to_create_immutables
//               boxShadow: [
//                 BoxShadow(
//                   color: const Color.fromARGB(255, 78, 75, 75),
//                   offset: const Offset(
//                     5.0,
//                     5.0,
//                   ),
//                   blurRadius: 5.0,
//                 ), //BoxShadow
//                 BoxShadow(
//                   color: Colors.white,
//                   offset: const Offset(0.0, 0.0),
//                   blurRadius: 0.0,
//                   spreadRadius: 0.0,
//                 ), //BoxShadow
//               ]),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Image(
//                     image: NetworkImage('${model.image}'),
//                     width: double.infinity,
//                     height: 200,
//                   ),
//                   if (model.discount != 0)
//                     Container(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           "DISCOUNT",
//                           style: TextStyle(fontSize: 9.1),
//                         ),
//                       ),
//                       color: Colors.red,
//                     ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text(
//                       '${model.name}',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(fontSize: 14, height: 1.4),
//                     ),
//                     Row(children: [
//                       Text(
//                         '${model.price.round()}' + ' \$',
//                         style: TextStyle(
//                             fontSize: 12, height: 1.4, color: Colors.blue),
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       if (model.discount != 0)
//                         Text(
//                           '${model.oldPrice.round()}',
//                           style: TextStyle(
//                               fontSize: 12,
//                               height: 1.4,
//                               color: Colors.grey,
//                               decoration: TextDecoration.lineThrough),
//                         ),
//                       Spacer(),
//                       IconButton(
//                           onPressed: () {
// TaskCubit.get(context).ChangFavorites(productid: model.id!);
//                           },
//                           icon: CircleAvatar(
//                             backgroundColor:TaskCubit.get(context).favoriteid[model.id]!?Color.fromARGB(88, 123, 123, 238):const Color.fromARGB(255, 192, 185, 185),
//                             child: Icon(
//                               Icons.favorite_border,
//                               size: 20,
//                             ),
//                           ))
//                     ])
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       )
//     ],
//   );
// }
