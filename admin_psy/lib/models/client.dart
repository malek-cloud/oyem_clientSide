import 'coach.dart';
import 'package:flutter/foundation.dart';

class Client {
  String nom, prenom, email, numTelephone, idCoach, age, password;
  String id = '-1';
  int gacaoch, gacummul, gaweek, credit, gaparrainage;

  bool parrainage;
  Client({
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
}
