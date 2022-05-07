import 'package:flutter/material.dart';

import '../screens/sizeconfig.dart';

class SignInConstant {
  static Widget signInPageImg = Image.asset(
    'assets/images/Welcome Illustration.png',
    height: he(318),
    width: wi(349),
  );
  static Text welcomeText = Text(
    'Welcome',
    style: TextStyle(fontSize: he(20),fontWeight: FontWeight.bold),
  );
  static Text discrip = Text(
    'Welcome to Organico Mobile Apps. Please fill in the field below to sign in.',
    style: TextStyle(fontSize: he(16)),
  );
}
