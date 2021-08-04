/*import 'package:admin_psy/screens/accueil.dart';
import 'package:admin_psy/screens/message.dart';
import 'package:admin_psy/screens/myProfile.dart';
import 'package:admin_psy/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'accueilBody.dart';
import'accueilAppBar.dart';
import 'drawer.dart';
class BottomBarNavv extends StatefulWidget {
  @override
  _BottomBarNavvState createState() => _BottomBarNavvState();
}

class _BottomBarNavvState extends State<BottomBarNavv> {
  List<Object> screens = [
    Settings(),
    MyProfile(),
    Accueil(),
    Messages(),
  ];
  int selected = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar :  CurvedNavigationBar(
      animationCurve: Curves.easeOut,
      index: 2,
      animationDuration: Duration(
        milliseconds: 500,
      ),
      height: 50,
      color: Theme.of(context).accentColor,
      backgroundColor: Colors.white,
      items: <Widget>[
        Icon(Icons.settings, size: 30, color: Colors.white),
        Icon(Icons.person, size: 30, color: Colors.white),
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.message, size: 30, color: Colors.white),
        Icon(Icons.people, size: 30, color: Colors.white),
      ],
      onTap: (index) {
        setState(() {
          selected = index;
        });
      },
      letIndexChange: (index) => true,
    ),
      
    );
    
  }
  
}
 */