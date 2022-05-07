import 'package:flutter/material.dart';
import 'package:organico/provider/pages_controller.dart';
import 'package:organico/screens/pages/cart_page.dart';
import 'package:organico/screens/pages/explore_page.dart';
import 'package:organico/screens/pages/home_pages.dart';
import 'package:organico/screens/pages/profiele_page.dart';
import 'package:organico/screens/sizeconfig.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomeMainPage extends StatelessWidget {
  HomeMainPage({Key? key}) : super(key: key);

  List pages = [
    HomePagess(),
    ExplorePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: pages[context.watch<PageControllerProvider>().curentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<PageControllerProvider>().curentindex,
        onTap: (v) {
          context.read<PageControllerProvider>().changePage(v);
        },
        selectedItemColor: const Color(0xFF2ECC71),
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_sharp), label: "Profile"),
        ],
      ),
    );
  }
}
