import 'dart:io';
import 'package:admin_psy/models/client.dart';
import 'package:admin_psy/screens/QuiSommeNous.dart';
import 'package:admin_psy/screens/feedBack.dart';
import 'package:admin_psy/screens/myProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../conf.dart';
import 'oneGrid.dart';
import '../screens/firstScreen.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
 
  bool isSignIn = false;
  String id;
  _getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String _id = sharedPreferences.getString('myId');
    id = _id;

    if (id != null) {
      print('hello hello');
      setState(() {
      //  _nom = sharedPreferences.getString('nom');
       // _prenom = sharedPreferences.getString('prenom');
        isSignIn = true;
      });
    }
  }

    Client currentClient(String id) {
    Client myClient = Client();
    client.forEach((element) {
      if (element.id == id) {
        myClient = element;
      }
    });
    return myClient;
  }

  @override
  void initState() {
    _getUserName();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                onTap: () => Get.off(MyProfile(id)),
                child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.16,
                            child: Image.asset('assets/couverture.png',
                                fit: BoxFit.fill)),
                        SizedBox(
                              height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.height * 0.2,
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                backgroundImage:  id == null || currentClient(id).photo == null
                                      ? AssetImage('assets/unknown.png')
                                      : FileImage(File(currentClient(id).photo)),
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: (isSignIn
                              ? Text(
                                  currentClient(id).prenom + " " + currentClient(id).nom,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Theme.of(context).primaryColor),
                                )
                              : Text(
                                  'Visitor',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Theme.of(context).primaryColor),
                                )),
                        ),
                      ],
                    )),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                color: Colors.white,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    GestureDetector(
                      child: OneGrid(
                        title: 'Communauté',
                        icon: Icon(
                          Icons.people,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: OneGrid(
                        title: 'Nouveauté',
                        icon: Icon(
                          Icons.new_releases,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(QuiSommeNous());
                      },
                      child: OneGrid(
                        title: 'Qui Sommes Nous',
                        icon: Icon(
                          Icons.perm_identity,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(FeedBack());
                      },
                      child: OneGrid(
                        title: 'FeedBack',
                        icon: Icon(
                          Icons.feedback,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: OneGrid(
                        title: 'Historique',
                        icon: Icon(
                          Icons.history,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.remove('email');
                        sharedPreferences.remove('password');
                        sharedPreferences.remove('myId');
                        Get.off(FirstScreen());
                      },
                      child: OneGrid(
                        title: 'Déconnection',
                        icon: Icon(
                          Icons.logout,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
