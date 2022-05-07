import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:organico/provider/counter.dart';
import 'package:organico/screens/sizeconfig.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: StreamBuilder(
        stream: _firestore.collection('explore').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // ignore: unused_local_variable
            var data = snapshot.data!.docs;
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: he(56),
                  width: wi(310),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: he(5),
                        blurRadius: he(30),
                        offset: const Offset(0, 20),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        he(10),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      onChanged: (v) {
                        context.read<SearchProvider>().chiqar(v, snapshot);
                      },
                      controller: _controller,
                      style: const TextStyle(fontSize: 23),
                      decoration: const InputDecoration(
                        hintText: 'Search here...',
                        border: InputBorder.none,
                      ),
                      scrollPadding: const EdgeInsets.only(left: 40),
                    ),
                  ),
                ),
                SizedBox(
                  height: 700,
                  width: double.infinity,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: he(22),
                      mainAxisExtent: he(230),
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: he(20)),
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber[50],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(he(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[context
                                        .watch<SearchProvider>()
                                        .order
                                        .toList()[index]]['name'],
                                  ),
                                  CachedNetworkImage(
                                      imageUrl: data[context
                                        .watch<SearchProvider>()
                                        .order
                                        .toList()[index]]['img'])
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: context.watch<SearchProvider>().order.length,
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Malumot kelishda Xato bor !!!'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    ));
  }
}
