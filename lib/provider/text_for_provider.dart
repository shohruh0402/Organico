import 'package:flutter/material.dart';

class TextFormForProvider extends ChangeNotifier {
  TextEditingController sms = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
}
