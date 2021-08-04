import 'package:admin_psy/screens/inscri.dart';
import 'package:admin_psy/screens/login.dart';
import 'package:flutter/material.dart';

import 'firstScreen.dart';

class QuiSommeNous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Qui somme nous'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => FirstScreen()),
            );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: BodyScreen(),
    );
  }
}

class BodyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset(
                    "assets/couverture.png",
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                'OYEM UNITY \n est un organisme basée à TUNIS, focalisant son travail essentiel sur le développement des compétences.Nous organisant différents types d’événement en Afrique pour des rencontres et le réseautage professionnel visant la croissance du cœur du monde, mais aussi des formations en ligne sur différentes thématiques lier au développement personnel et à la communication.',
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).primaryColor),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Inscri()),
                    );
                  },
                  child: Text('Inscription'),
                ),
              ),
              SizedBox(
                height : 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => Login()),
                    );
                  },
                  child: Text('Se Connecter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
