import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  Set order = {};
  chiqar(String v, AsyncSnapshot<QuerySnapshot> doc) {
    order.clear();
    for (var i = 0; i < doc.data!.docs.length; i++) {
      if (v.isEmpty) {
        order.clear();
      } else if ((doc.data!.docs[i]['name'] as String)
          .toLowerCase()
          .contains(v)) {
        order.add(i);
      }
    }
    notifyListeners();
  }
}
