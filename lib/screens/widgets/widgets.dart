import 'package:flutter/material.dart';

import '../sizeconfig.dart';

class DetailDelivery extends StatelessWidget {
  Icon icon;
  DetailDelivery({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: he(48),
      width: wi(48),
      decoration: BoxDecoration(
        color: Color.fromRGBO(46, 204, 113, 0.15),
        borderRadius: BorderRadius.all(
          Radius.circular(
            he(10),
          ),
        ),
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}

class MainText extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight fontWeight;
  MainText(
      {Key? key,
      required this.text,
      this.size = 18,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: he(size), color: color, fontWeight: fontWeight),
    );
  }
}

class CuponContainer extends StatelessWidget {
  const CuponContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: he(44),
      width: wi(44),
      decoration: BoxDecoration(
        color: Color(0xFF2ECC71),
        borderRadius: BorderRadius.all(
          Radius.circular(
            he(10),
          ),
        ),
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/Ic - Coupon.png',
          height: he(24),
          color: Colors.white,
        ),
      ),
    );
  }
}

class AddandRemove extends StatelessWidget {
  Icon icon;
  AddandRemove({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: he(34),
      width: wi(36),
      decoration: BoxDecoration(
        color: const Color(0xFF2ECC71),
        borderRadius: BorderRadius.all(
          Radius.circular(
            he(10),
          ),
        ),
      ),
      child: Center(child: icon),
    );
  }
}
