import 'package:flutter/foundation.dart';

class Client with ChangeNotifier {
  String nom, prenom, email, numTelephone, idCoach, age, password, photo;
  String id = '-1';
  int gacaoch, gacummul, gaweek, credit, gaparrainage;
  List<String> favArticles = [];

  bool parrainage;
  Client({
    this.photo,
    this.favArticles,
    this.id,
    this.idCoach,
    this.email,
    this.nom,
    this.prenom,
    this.age,
    this.numTelephone,
    this.credit,
    this.gacaoch,
    this.gacummul,
    this.gaparrainage,
    this.gaweek,
    this.password,
  });
  String get getEmail {
    return email;
  }

  String getPassword() {
    return password;
  }

  String toString() {
    return 'Client id ${this.id}, email: ${this.email}, password :${this.password}, nom :${this.nom}';
  }

  void ajouterFavoris(String idArticle) {
    //print('waaa');
    //print(this.favArticles);
   
    if (this.favArticles.contains(idArticle)) {
      this.favArticles.remove(idArticle);
    } else {
      this.favArticles.add(idArticle);
    }
     print(this.favArticles.contains(idArticle));
    notifyListeners();
  }
}
