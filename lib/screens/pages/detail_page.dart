import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico/constant/color_constant.dart';
import 'package:organico/provider/sanoq_provider.dart';
import 'package:organico/screens/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_or_light_theme_provider.dart';
import '../sizeconfig.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  var word;
  DetailPage({Key? key, this.word}) : super(key: key);
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    print('------------${word[0]}');
    BacroundThemeProvider read = context.read<BacroundThemeProvider>();
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: read.blackAndWhite(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: he(55),
            ),
            CachedNetworkImage(
              imageUrl: word[0]['img'],
              height: he(194),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: he(35), left: wi(20), right: wi(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    word[0]['name'],
                    style: TextStyle(
                      color: read.blackAndWhiteRe(),
                      fontWeight: FontWeight.w500,
                      fontSize: he(32),
                    ),
                  ),
                  SizedBox(height: he(8)),
                  Row(
                    children: [
                      //! --------------------------------------------------------------
                      Expanded(
                        child: Text(
                          word[0]['shop'],
                          style: TextStyle(
                            color: const Color(0xFF92929D),
                            fontSize: he(18),
                          ),
                        ),
                      ),
                      //! --------------------------------------------------------------
                      SizedBox(
                        width: wi(155),
                      ),
                      //! --------------------------------------------------------------
                      GestureDetector(
                        onTap: () {
                          context.read<SanoqProvider>().ayir(word["price"]);
                        },
                        child: Container(
                            height: he(40),
                            width: wi(40),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2ECC71),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  he(10),
                                ),
                              ),
                            ),
                            child: const Center(child: Icon(Icons.remove))),
                      ),
                      //! --------------------------------------------------------------
                      SizedBox(
                        width: wi(10),
                      ),
                      //! --------------------------------------------------------------
                      Text(context.watch<SanoqProvider>().sanoq.toString(),
                          style: const TextStyle(fontSize: 24)),
                      SizedBox(
                        width: wi(10),
                      ),
                      //! --------------------------------------------------------------
                      InkWell(
                        onTap: () {
                          context.read<SanoqProvider>().qosh(word[0]['price']);
                        },
                        child: Container(
                          height: he(40),
                          width: wi(40),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2ECC71),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                he(10),
                              ),
                            ),
                          ),
                          child: const Center(child: Icon(Icons.add)),
                        ),
                      ),
                    ],
                  ),
                  //! --------------------------------------------------------------
                  SizedBox(
                    height: he(10),
                  ),
                  //! --------------------------------------------------------------
                  Text(
                    '\$${context.watch<SanoqProvider>().jami}/kg',
                    style: TextStyle(
                      color: read.blackAndWhiteRe(),
                      fontWeight: FontWeight.w500,
                      fontSize: he(24),
                    ),
                  ),
                  SizedBox(height: he(54)),
                  //! --------------------------------------------------------------
                  Text(
                    'Detail',
                    style: TextStyle(
                      color: read.blackAndWhiteRe(),
                      fontWeight: FontWeight.w500,
                      fontSize: he(18),
                    ),
                  ),
                  //! --------------------------------------------------------------
                  SizedBox(height: he(16)),
                  //! --------------------------------------------------------------
                  Text(
                    word[0]['dis'],
                    style: TextStyle(
                      color: const Color(0xFF92929D),
                      fontSize: he(16),
                    ),
                  ),
                  //! --------------------------------------------------------------
                  SizedBox(
                    height: he(20),
                  ),
                  //! --------------------------------------------------------------
                  Row(
                    children: [
                      DetailDelivery(
                          icon: Icon(
                        Icons.access_time_sharp,
                        color: Col.mainColor,
                      )),
                      SizedBox(
                        width: wi(16),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: he(5),
                          ),
                          MainText(
                            text: 'Time Delivery',
                            color: read.blackAndWhiteRe(),
                          ),
                          SizedBox(
                            height: he(5),
                          ),
                          MainText(
                            text: '25-30 Min',
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  //! --------------------------------------------------------------
                  SizedBox(
                    height: he(20),
                  ),
                  //! --------------------------------------------------------------
                  Row(
                    children: [
                      DetailDelivery(
                          icon: Icon(
                        Icons.airplane_ticket_sharp,
                        color: Col.mainColor,
                      )),
                      SizedBox(
                        width: wi(16),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: he(5),
                          ),
                          MainText(
                            text: 'Category',
                            color: read.blackAndWhiteRe(),
                          ),
                          SizedBox(
                            height: he(5),
                          ),
                          MainText(
                            text: 'Vegetable',
                            color: Colors.grey,
                          ),
                        ],
                      )
                    ],
                  ),
                  //! --------------------------------------------------------------
                  SizedBox(
                    height: he(39),
                  ),
                  //! --------------------------------------------------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //! --------------------------------------------------------------
                      GestureDetector(
                        child: Container(
                          height: he(52),
                          width: wi(298),
                          decoration: BoxDecoration(
                            color: Col.mainColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                he(100),
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Add to basket',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: he(16),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),

                      //! --------------------------------------------------------------
                      SizedBox(
                        height: he(52),
                        width: wi(52),
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.sms,
                            size: 22,
                            color: read.blackAndWhiteRe(),
                          ),
                          backgroundColor: read.buttonTheme(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
