import 'package:flutter/material.dart';
import 'package:organico/constant/sign_in_const.dart';
import 'package:organico/provider/dark_or_light_theme_provider.dart';
import 'package:organico/screens/sizeconfig.dart';
import 'package:provider/provider.dart';

class SignInpage extends StatelessWidget {
  const SignInpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      
      backgroundColor: context.watch<BacroundThemeProvider>().blackAndWhite(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: he(46),
            left: wi(20),
            right: wi(20),
            bottom: he(45),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SignInConstant.signInPageImg,
                SizedBox(height: he(65)),
                SignInConstant.welcomeText,
                SizedBox(height: he(16)),
                SignInConstant.discrip,
                SizedBox(height: he(16)),
                TextFormField(
                  maxLength: 9,
                  onTap: () {},
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.blue,
                    counter: const Offstage(),
                    prefixIcon: const Icon(Icons.circle),
                    alignLabelWithHint: false,
                    prefixText: '+998',
                    hintText: 'Your Phone Number',
                    prefixIconConstraints:
                        BoxConstraints(maxWidth: wi(60), minWidth: wi(60)),
                    prefixStyle: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: he(16)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                         Radius.circular(100.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
