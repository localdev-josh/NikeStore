import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoe_store/styleguide/container_styles.dart';
import 'package:shoe_store/styleguide/text_styles.dart';

class NavTabItems extends StatelessWidget {
  final bool isSelected;
  final String text;
  final IconData iconName;
  final Function onTabTap;

  NavTabItems({this.isSelected, this.text, this.onTabTap, this.iconName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabTap,
      child: AnimatedContainer(
        width: 180.0,
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        decoration: isSelected ? selectedTabStyle : defaultTabStyle,
        duration: const Duration(milliseconds: 300),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Icon(iconName, color: isSelected ? selectedIconStyle : iconStyle,)
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 4.0),
                child: AnimatedDefaultTextStyle(
                    child: Text(text),
                    style: isSelected ? selectedMenuTextStyle : menuTextStyle,
                    duration: const Duration(milliseconds: 300),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}