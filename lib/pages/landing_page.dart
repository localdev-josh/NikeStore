import 'package:flutter/material.dart';
import 'package:shoe_store/styleguide/colors.dart';
import 'package:shoe_store/styleguide/container_styles.dart';
import 'package:shoe_store/styleguide/text_styles.dart';
import 'package:shoe_store/widgets/app_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:shoe_store/widgets/nav_items.dart';

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
                                  fontSize: 21,
                                  fontFamily: "poppins"),
                            ),
                            SizedBox(
                              height: 17.0,
                            ),
                            Text("Ajiboye Joshua", style: TextStyle(
                              fontFamily: "poppins",
                              color: Colors.white,
                              fontSize: 21,
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
                            height: 11.0,
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
                            height: 11.0,
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
                            height: 11.0,
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
                            height: 11.0,
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
                            height: 11.0,
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
            child: ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
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
                            height: 45,
                          ),
                        ),
                        Text(
                          "WELCOME",
                          style: menuCenterStyle,
                        ),
                        Container(
                          height: 30.0,
                          width: 30.0,
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
                    SizedBox(
                      height: 50.0,
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
                                    bottom: -40,
//                                top: 3,
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
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "poppins"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15.0),
                                    child: Text(
                                      "Men's Running Shoe",
                                      style: TextStyle(
                                          color: Color(0XFFA1A1A1),
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "poppins"),
                                    ),
                                  ),
                                ],
                              ),
//                          color: Colors.grey,
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 35.0),
                              height: 65.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.only(right: 50.0),
                                    padding: const EdgeInsets.all(15.0),
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
                  height: 30.0,
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
                                  height: 100.0,
                                  margin: const EdgeInsets.only(
                                      left: 40.0, top: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                Container(
                                  height: 110,
                                  margin: const EdgeInsets.only(left: 40.0),
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
                              margin: const EdgeInsets.only(left: 25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nike Air Zoom Winflo 6",
                                    style: TextStyle(
                                        color: Color(0XFF08070F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Men's Tennis Shoe",
                                    style: TextStyle(
                                        color: Color(0XFFB9B9B9), fontSize: 16),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 100.0,
                                  margin: const EdgeInsets.only(
                                      left: 40.0, top: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF5F5F5),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                                Container(
                                  height: 110,
                                  margin: const EdgeInsets.only(left: 40.0),
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
                              margin: const EdgeInsets.only(left: 25.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nike Joyride Run FlyKnit",
                                    style: TextStyle(
                                        color: Color(0XFF08070F),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Men's Running Shoe",
                                    style: TextStyle(
                                        color: Color(0XFFB9B9B9), fontSize: 16),
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
      ),
    );
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
