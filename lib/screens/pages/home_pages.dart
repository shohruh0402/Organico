import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:organico/screens/sizeconfig.dart';
import 'package:organico/screens/widgets/widgets.dart';
import '../../constant/color_constant.dart';
import '../../function/funcsiya.dart';

class HomePagess extends StatelessWidget {
  HomePagess({Key? key}) : super(key: key);
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: he(70)),
            MainText(
              text: 'Your Location',
              size: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: he(6)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainText(
                  text: 'Bandung, Cimahi',
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
            SizedBox(height: he(20)),
            GestureDetector(
              child: Container(
                height: he(48),
                width: wi(374),
                decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F5),
                    borderRadius: BorderRadius.all(Radius.circular(he(100)))),
                child: Row(
                  children: [
                    SizedBox(width: wi(16)),
                    const Icon(Icons.search),
                    SizedBox(width: wi(10)),
                    MainText(
                      text: 'Search anything here',
                      size: 16,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            SizedBox(height: he(48)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: wi(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CuponContainer(),
                  SizedBox(width: wi(16)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainText(
                          text: 'You have 3 coupon',
                          fontWeight: FontWeight.bold),
                      SizedBox(
                        height: he(4),
                      ),
                      MainText(
                        text: 'Let’s use this coupon',
                        size: 14,
                      ),
                    ],
                  ),
                  SizedBox(width: wi(115)),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
            SizedBox(height: he(44)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: wi(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainText(
                    text: 'Choose Category',
                    fontWeight: FontWeight.w700,
                  ),
                  MainText(
                    text: 'See all',
                    size: 14,
                  ),
                ],
              ),
            ),
            SizedBox(height: he(16)),
            StreamBuilder(
                stream: _firestore.collection('category').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!.docs;
                    return Column(
                      children: [
                        SizedBox(
                          height: he(140),
                          width: double.infinity,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Container(
                                  width: wi(123),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: he(16),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Col.color[Random().nextInt(6)],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        he(10),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: he(20), left: wi(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl: data[index]['fonimg'],
                                          height: he(59),
                                          width: wi(72),
                                        ),
                                        SizedBox(
                                          height: he(14),
                                        ),
                                        MainText(
                                          text: data[index]['name'],
                                          fontWeight: FontWeight.bold,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, '/vegetable',
                                      arguments: data[index]);
                                },
                              );
                            },
                            itemCount: data.length,
                          ),
                        ),
                        SizedBox(height: he(48)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: wi(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainText(
                                text: 'Best Sale',
                                fontWeight: FontWeight.w700,
                              ),
                              MainText(
                                text: 'See all',
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: he(16)),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator.adaptive();
                  }
                }),
            StreamBuilder(
                stream: _firestore.collection('explore').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!.docs;
                    return SizedBox(
                      height: he(247),
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              width: wi(196),
                              margin: EdgeInsets.symmetric(
                                horizontal: he(16),
                              ),
                              decoration: BoxDecoration(
                                color: Col.color[Random().nextInt(6)],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    he(10),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(he(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: data[Func(data).price[index]]
                                          ['img'],
                                      height: he(79),
                                      width: wi(97),
                                    ),
                                    SizedBox(height: he(14)),
                                    MainText(
                                      text: data[Func(data).price[index]]
                                          ['name'],
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: he(4)),
                                    MainText(
                                      text: data[Func(data).price[index]]
                                          ['shop'],
                                      size: 14,
                                    ),
                                    SizedBox(
                                      height: he(26),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${data[Func(data).price[index]]['price']}/kg',
                                          style: TextStyle(
                                              fontSize: he(16),
                                              fontWeight: FontWeight.w600),
                                        ),
                                        AddandRemove(
                                            icon: const Icon(Icons.add)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/detail',
                                  arguments: [
                                    data[Func(data).price[index]],
                                    Func(data).price[index]
                                  ]);
                            },
                          );
                        },
                        itemCount: Func(data).price.length,
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator.adaptive();
                  }
                })
          ],
        ),
      ),
    ));
  }
}
