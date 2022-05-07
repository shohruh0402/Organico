import 'package:flutter/material.dart';
import 'package:organico/screens/pages/category.dart';
import 'package:organico/screens/pages/detail_page.dart';
import 'package:organico/screens/pages/home_main_page.dart';
import 'package:organico/screens/pages/search_page.dart';
import 'package:organico/screens/pages/sign_in_page.dart';
import 'package:organico/screens/pages/category_ontap_page.dart';

class MyRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeMainPage(),
        );

      case '/vegetable':
        return MaterialPageRoute(
          builder: (_) => CategoryPage(wdata: args),
        );

      case '/signin':
        return MaterialPageRoute(
          builder: (_) => SignInpage(),
        );

      case '/detail':
        return MaterialPageRoute(
          builder: (_) => DetailPage(
            word: args,
          ),
        );

      case '/search':
        return MaterialPageRoute(
          builder: (_) => SearchPage(),
        );
    }
  }
}
