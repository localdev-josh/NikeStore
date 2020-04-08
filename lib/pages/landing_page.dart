import 'package:flutter/material.dart';
import 'package:shoe_store/styleguide/colors.dart';
import 'package:shoe_store/styleguide/container_styles.dart';
import 'package:shoe_store/styleguide/text_styles.dart';
import 'package:shoe_store/widgets/app_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoe_store/widgets/nav_items.dart';
import 'package:shoe_store/styleguide/size_config.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenHeight, screenWidth;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.65).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[AppBackground(), menu(context), dashboard(context)],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: screenHeight,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(left: 20.0, top: 70.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/profilepic2.jpg"),
                                                fit: BoxFit.contain),
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Hey",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 2.5 * SizeConfig.textMultiplier,
                                  fontFamily: "poppins"),
                            ),
                            SizedBox(
                              height: 2 * SizeConfig.heightMultiplier,
                            ),
                            Text("Ajiboye Joshua", style: TextStyle(
                              fontFamily: "poppins",
                              color: Colors.white,
                              fontSize: 2.47 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.bold
                            ),)
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight / 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          NavTabItems(
                            isSelected: selectedTabIndex == 0,
                            onTabTap: () {
                              onTabTap(0);
                            },
                            iconName: CupertinoIcons.profile_circled,
                            text: "Profile",
                          ),
                          SizedBox(
                            height: 1.3 * SizeConfig.heightMultiplier,
                          ),
                          NavTabItems(
                            isSelected: selectedTabIndex == 1,
                            onTabTap: () {
                              onTabTap(1);
                            },
                            iconName: CupertinoIcons.home,
                            text: "Home Page",
                          ),
                          SizedBox(
                            height: 1.3 * SizeConfig.heightMultiplier,
                          ),
                          NavTabItems(
                            isSelected: selectedTabIndex == 2,
                            onTabTap: () {
                              onTabTap(2);
                            },
                            iconName: CupertinoIcons.shopping_cart,
                            text: "My Cart",
                          ),
                          SizedBox(
                            height: 1.3 * SizeConfig.heightMultiplier,
                          ),
                          NavTabItems(
                            isSelected: selectedTabIndex == 3,
                            onTabTap: () {
                              onTabTap(3);
                            },
                            iconName: CupertinoIcons.heart,
                            text: "Favorite",
                          ),
                          SizedBox(
                            height: 1.3 * SizeConfig.heightMultiplier,
                          ),
                          NavTabItems(
                            isSelected: selectedTabIndex == 4,
                            onTabTap: () {
                              onTabTap(4);
                            },
                            iconName: CupertinoIcons.share_solid,
                            text: "Orders",
                          ),
                          SizedBox(
                            height: 1.3 * SizeConfig.heightMultiplier,
                          ),
                          NavTabItems(
                            isSelected: selectedTabIndex == 5,
                            onTabTap: () {
                              onTabTap(5);
                            },
                            iconName: CupertinoIcons.bell,
                            text: "Notifications",
                          ),
                        ],
                      ),
                      Container(
                        width: 20,
                        height: 10,
                        margin: const EdgeInsets.only(left: 22, top: 20, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(flex: 3,child: Divider(color: Colors.white,)),
                            Expanded(flex: 4,child: Divider(),)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: 180.0,
                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                              decoration: defaultTabStyle,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Icon(Icons.exit_to_app, color: iconStyle,)
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 4.0),
                                      child: Text("Sign Out", style: menuTextStyle,),
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.5 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Transform.rotate(
          angle: isCollapsed ? 0 : -0.2,
          child: Material(
            animationDuration: duration,
            elevation: 8.0,
            borderRadius: BorderRadius.circular(isCollapsed ? 0 : 70.0),
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 6.95 * SizeConfig.heightMultiplier),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              height: 3.53 * SizeConfig.heightMultiplier,
                            ),
                            SizedBox(
                              height: 5.29 * SizeConfig.heightMultiplier,
                            ),
                            Stack(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      width: screenWidth / 1.35,
                                      height: screenHeight / 2,
                                      decoration: BoxDecoration(
                                          color: Color(0XFFF7F7F7),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(50.0),
                                              bottomLeft: Radius.circular(50.0))),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      height: screenHeight / 3,
                                      width: screenWidth,
                                      child: Stack(
                                        fit: StackFit.loose,
                                        overflow: Overflow.clip,
                                        textDirection: TextDirection.ltr,
                                        alignment: AlignmentDirectional.topStart,
                                        children: <Widget>[
                                          Positioned(
                                            right: screenWidth / 7.5,
                                            width: screenWidth / 1.15,
                                            bottom: -4.70 * SizeConfig.heightMultiplier,
                                            child: Transform.rotate(
                                              angle: -0.35,
                                              child: Image.asset(
                                                "assets/images/joyridee.png",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: screenWidth / 1.3,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Nike Joyride FlyKnit",
                                            style: TextStyle(
                                                color: Color(0XFF070513),
                                                fontSize: 3.05 * SizeConfig.textMultiplier,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "poppins"),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 1.76 * SizeConfig.heightMultiplier),
                                            child: Text(
                                              "Men's Running Shoe",
                                              style: TextStyle(
                                                  color: Color(0XFFA1A1A1),
                                                  fontSize: 2.23 * SizeConfig.textMultiplier,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "poppins"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 3.92 * SizeConfig.heightMultiplier),
                                      height: 7.64 * SizeConfig.heightMultiplier,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 12.72 * SizeConfig.widthMultiplier),
                                            padding: EdgeInsets.all(1.76 * SizeConfig.heightMultiplier),
                                            child: Icon(
                                              CupertinoIcons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0XFFFE8071),
                                                borderRadius:
                                                BorderRadius.circular(20.0)),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4.83 * SizeConfig.heightMultiplier,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 11.76 * SizeConfig.heightMultiplier,
                                          margin: EdgeInsets.only(
                                              left: 10.17 * SizeConfig.widthMultiplier,
                                              top: 1.18 * SizeConfig.heightMultiplier),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFF5F5F5),
                                              borderRadius:
                                              BorderRadius.circular(20.0)),
                                        ),
                                        Container(
                                          height: 12.94 * SizeConfig.heightMultiplier,
                                          margin: EdgeInsets.only(left: 10.18 * SizeConfig.widthMultiplier),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/joyrid.png")),
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 6.36 * SizeConfig.widthMultiplier),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Nike Air Zoom Winflo 6",
                                            style: TextStyle(
                                                color: Color(0XFF08070F),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 2.24 * SizeConfig.textMultiplier),
                                          ),
                                          SizedBox(
                                            height: 1.76 * SizeConfig.textMultiplier,
                                          ),
                                          Text(
                                            "Men's Tennis Shoe",
                                            style: TextStyle(
                                                color: Color(0XFFB9B9B9), fontSize: 1.88 * SizeConfig.textMultiplier),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 3.53 * SizeConfig.heightMultiplier,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          height: 11.76 * SizeConfig.heightMultiplier,
                                          margin: EdgeInsets.only(
                                              left: 10.17 * SizeConfig.widthMultiplier,
                                              top: 1.18 * SizeConfig.heightMultiplier),
                                          decoration: BoxDecoration(
                                              color: Color(0xFFF5F5F5),
                                              borderRadius:
                                              BorderRadius.circular(20.0)),
                                        ),
                                        Container(
                                          height: 12.94 * SizeConfig.heightMultiplier,
                                          margin: EdgeInsets.only(left: 10.18 * SizeConfig.widthMultiplier),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/joyr.png")),
                                          ),
                                        ),
                                      ],
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 6.36 * SizeConfig.widthMultiplier),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Nike Joyride Run FlyKnit",
                                            style: TextStyle(
                                                color: Color(0XFF08070F),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 2.24 * SizeConfig.textMultiplier),
                                          ),
                                          SizedBox(
                                            height: 1.76 * SizeConfig.heightMultiplier,
                                          ),
                                          Text(
                                            "Men's Running Shoe",
                                            style: TextStyle(
                                                color: Color(0XFFB9B9B9), fontSize: 1.88 * SizeConfig.textMultiplier),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(isCollapsed ? 0 : 70.0),
                  ),
                  padding: EdgeInsets.only(top: 7.65 * SizeConfig.heightMultiplier, bottom: 2.35 * SizeConfig.heightMultiplier),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            isCollapsed
                                ? _controller.forward()
                                : _controller.reverse();
                            isCollapsed = !isCollapsed;
                          });
                        },
                        child: Image.asset(
                          "assets/images/logo/menu.png",
                          height: 5.29 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      Text(
                        "WELCOME",
                        style: menuCenterStyle,
                      ),
                      Container(
                        height: 3.53 * SizeConfig.heightMultiplier,
                        width: 3.53 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/profilepic2"
                                        ""
                                        ".jpg"),
                                fit: BoxFit.fitWidth)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
