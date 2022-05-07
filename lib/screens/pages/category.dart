// import 'dart:math';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:organico/provider/dark_or_light_theme_provider.dart';
// import 'package:organico/screens/sizeconfig.dart';
// import 'package:provider/provider.dart';

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);
//   final _firestore = FirebaseFirestore.instance;
//   // ignore: unused_field
//   final List<Color> _color = [
//     const Color.fromRGBO(227, 85, 63, 0.15),
//     const Color.fromRGBO(118, 178, 38, 0.15),
//     const Color.fromRGBO(63, 125, 60, 0.15),
//     const Color.fromRGBO(233, 176, 79, 0.15),
//     const Color.fromRGBO(234, 129, 47, 0.15),
//     const Color.fromRGBO(151, 3, 29, 0.15),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     BacroundThemeProvider read = context.read<BacroundThemeProvider>();
//     BacroundThemeProvider watch = context.watch<BacroundThemeProvider>();
//     List vege = [];
//     SizeConfig().init(context);
//     return Scaffold(
//       backgroundColor: read.blackAndWhite(),
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             read.themeTrueChange();
//           },
//           icon: Icon(
//             Icons.dark_mode_outlined,
//             color: read.blackAndWhiteRe(),
//           ),
//         ),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: StreamBuilder(
//         stream: _firestore.collection('vegetable').snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasData) {
//             var data = snapshot.data!.docs;
//             Hive.box("data").put(0, data);
//             vege.clear();
//             vege.add(Hive.box('data').values.toList()[0]);
//             return Center(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.87,
//                     width: double.infinity,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: he(20)),
//                       child: GridView.builder(
//                         physics: const BouncingScrollPhysics(),
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisSpacing: he(22),
//                             mainAxisExtent: he(230),
//                             crossAxisSpacing: he(22)),
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, '/detail',
//                                   arguments: vege[0][index]);
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: _color[Random().nextInt(6)],
//                                 borderRadius: const BorderRadius.all(
//                                   Radius.circular(20),
//                                 ),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.all(he(20)),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     CachedNetworkImage(
//                                       imageUrl: vege[0][index]['img'],
//                                       height: he(79),
//                                     ),
//                                     SizedBox(height: he(20)),
//                                     Text(
//                                       vege[0][index]['nomi'],
//                                       style: TextStyle(
//                                         fontSize: he(16),
//                                         fontWeight: FontWeight.w800,
//                                       ),
//                                     ),
//                                     SizedBox(height: he(4)),
//                                     Text(
//                                       vege[0][index]['shop'],
//                                       style: TextStyle(
//                                         color: const Color(0xFF92929D),
//                                         fontSize: he(14),
//                                       ),
//                                     ),
//                                     SizedBox(height: he(16)),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           '\$${vege[0][index]['price']}/kg',
//                                           style: TextStyle(
//                                               fontSize: he(16),
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                         Container(
//                                           height: he(34),
//                                           width: wi(36),
//                                           decoration: BoxDecoration(
//                                             color: const Color(0xFF2ECC71),
//                                             borderRadius: BorderRadius.all(
//                                               Radius.circular(
//                                                 he(10),
//                                               ),
//                                             ),
//                                           ),
//                                           child: const Center(
//                                               child: Icon(Icons.add)),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                         itemCount: snapshot.data!.docs.length,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator.adaptive());
//           }
//         },
//       ),
//     );
//   }

//   // Widget builUser(User user) => Text(user.name);

//   // Stream<List<User>> read() => FirebaseFirestore.instance
//   //     .collection('vegetable')
//   //     .snapshots()
//   //     .map((snapshot) =>
//   //         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
// }
