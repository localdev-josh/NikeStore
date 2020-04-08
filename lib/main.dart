import 'package:flutter/material.dart';
import 'package:shoe_store/pages/landing_page.dart';
import 'package:shoe_store/styleguide/strings.dart';
import 'package:shoe_store/styleguide/size_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
          builder: (BuildContext context, Widget child) {
            var textScaleFactor = 0.86;
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
              child: LandingPage(),
            );
          },
          debugShowCheckedModeBanner: false,
          title: Strings.appTitle,
        );
      });
    });
  }
}