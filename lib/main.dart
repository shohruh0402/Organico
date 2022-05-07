import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:organico/provider/counter.dart';
import 'package:organico/provider/dark_or_light_theme_provider.dart';
import 'package:organico/provider/pages_controller.dart';
import 'package:organico/provider/sanoq_provider.dart';
import 'package:organico/provider/text_for_provider.dart';
import 'package:organico/routers/my_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('data');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TextFormForProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BacroundThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SanoqProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageControllerProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final MyRouter _forroute = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyText2: Theme.of(context).textTheme.bodyText1!.apply(
                  color:
                      context.watch<BacroundThemeProvider>().blackAndWhiteRe()),
            ),
      ),
      initialRoute: '/',
      onGenerateRoute: _forroute.onGenerateRoute,
    );
  }
}
