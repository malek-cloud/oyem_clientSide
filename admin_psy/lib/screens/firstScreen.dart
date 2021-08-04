import 'package:admin_psy/providers/clientProv.dart';
import 'package:admin_psy/screens/QuiSommeNous.dart';
import 'package:admin_psy/screens/accueil.dart';
import 'package:admin_psy/screens/inscri.dart';
import 'package:admin_psy/screens/login.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Image.asset('assets/couverture.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        'assets/swipe-left.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    onHorizontalDragStart: (dragUpdateDetails) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Accueil(),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onHorizontalDragStart: (dragUpdateDetails) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Accueil(),
                        ),
                      );
                    },
                    child: Text(
                      '  Articles  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/swipe-up.png'),
                        ),
                        onVerticalDragStart: (dragUpdateDetails) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => QuiSommeNous(),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onVerticalDragStart: (dragUpdateDetails) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => QuiSommeNous(),
                            ),
                          );
                        },
                        child: Text(
                          'Qui Sommes Nous',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width * 0.4,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset(
                            'assets/logo.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onVerticalDragEnd: (dragUpdateDetails) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Inscri(),
                            ),
                          );
                        },
                        child: Text(
                          'Inscription',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/swipe-down.png'),
                        ),
                        onVerticalDragEnd: (dragUpdateDetails) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Inscri()),
                          );
                        },
                      ),
                    ],
                  ),
                  GestureDetector(
                    onHorizontalDragEnd: (dragUpdateDetails) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Login(),
                        ),
                      );
                    },
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 30,
                      height: 30,
                      child: Image.asset(
                        'assets/swipe-right.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    onHorizontalDragEnd: (dragUpdateDetails) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => Login(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Text(
                '🍀 D\'une simple pensée , émane notre réalité ...',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* */

/* */
