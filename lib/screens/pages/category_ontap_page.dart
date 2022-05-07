import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico/constant/color_constant.dart';
import 'package:organico/provider/dark_or_light_theme_provider.dart';
import 'package:organico/screens/sizeconfig.dart';
import 'package:organico/screens/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  var wdata;
  CategoryPage({Key? key, this.wdata}) : super(key: key);
  final _firestore = FirebaseFirestore.instance;
  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    BacroundThemeProvider read = context.read<BacroundThemeProvider>();
    BacroundThemeProvider watch = context.watch<BacroundThemeProvider>();
    List vege = [];
    List lent = [];
    lent = wdata['nomi'];
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: read.blackAndWhite(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            read.themeTrueChange();
          },
          icon: Icon(
            Icons.dark_mode_outlined,
            color: read.blackAndWhiteRe(),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.87,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: he(20)),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: he(22),
                      mainAxisExtent: he(251),
                      crossAxisSpacing: he(22)),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // onTap: () {
                      //   Navigator.pushNamed(context, '/detail',
                      //       arguments: [wdata['']]);
                      // },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Col.color[Random().nextInt(6)],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(he(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedNetworkImage(
                                imageUrl: wdata['img'][index],
                                height: he(89),
                              ),
                              SizedBox(height: he(20)),
                              Text(
                                wdata['nomi'][index],
                                style: TextStyle(
                                  fontSize: he(16),
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: he(4)),
                              Text(
                                wdata['shop'][index],
                                style: TextStyle(
                                  color: const Color(0xFF92929D),
                                  fontSize: he(14),
                                ),
                              ),
                              SizedBox(height: he(16)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${wdata['price'][index]}/kg',
                                    style: TextStyle(
                                        fontSize: he(16),
                                        fontWeight: FontWeight.w600),
                                  ),
                                  AddandRemove(icon: const Icon(Icons.add))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: lent.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget builUser(User user) => Text(user.name);

  // Stream<List<User>> read() => FirebaseFirestore.instance
  //     .collection('vegetable')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
