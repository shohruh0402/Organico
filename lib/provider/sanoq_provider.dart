import 'package:flutter/foundation.dart';

class SanoqProvider extends ChangeNotifier {
  int sanoq = 1;
  double jami = 0;

  qosh(narx){
    sanoq+=1;
    jami = narx * sanoq;
    notifyListeners();
  }
  
  ayir(narx){
    sanoq-=1;
    jami = narx * sanoq;
    notifyListeners();
  }
}