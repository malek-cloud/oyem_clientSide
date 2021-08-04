import 'package:admin_psy/screens/accueil.dart';
import 'package:admin_psy/screens/firstScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail;
String finalPassword;

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
   void initState() {
    getInscriData().whenComplete(() async => Get.to(
        (finalEmail == null || finalPassword == null)
            ? FirstScreen()
            : Accueil()));
    super.initState();
  }

  Future getInscriData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    var obtainedPassword = sharedPreferences.getString('password');
    setState(() {
      finalEmail = obtainedEmail;
      finalPassword = obtainedPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:MediaQuery.of(context).size.width * 0.3 ,
              width:MediaQuery.of(context).size.width * 0.3 ,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Loading ...',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Colors.transparent
                )),
                SizedBox(
              height: 20,
            ),
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,

                ),
          ],
        ),
      ),
    ),
    );
  }
}
