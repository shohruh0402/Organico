import 'package:flutter/foundation.dart';

class PageControllerProvider extends ChangeNotifier{
  int curentindex = 0;
  changePage(int v){
    curentindex = v;
    notifyListeners();
  }
}