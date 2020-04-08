import 'package:flutter/material.dart';
import 'package:shoe_store/styleguide/colors.dart';
import 'package:shoe_store/styleguide/size_config.dart';

final TextStyle menuTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 1.64 * SizeConfig.textMultiplier,
    fontFamily: "poppins"
);

final TextStyle selectedMenuTextStyle = TextStyle(
  color: Color(0XFFC4727E),
  fontSize: 1.64 * SizeConfig.textMultiplier,
  fontFamily: "poppins"
);

final Color selectedIconStyle = Color(0XFFF76C4B);

final Color iconStyle = Color(0XFFFFFFFF);

final TextStyle menuCenterStyle = TextStyle(
  color: Color(0XFFCBCBCD),
  fontSize: 2.11 * SizeConfig.textMultiplier,
  fontFamily: 'Poppins',
  letterSpacing: 2.0
);