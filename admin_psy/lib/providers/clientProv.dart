import 'package:admin_psy/models/client.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientProv with ChangeNotifier {
  List<Client> _client = [
    /*Client(
      age: 23,
      prenom: 'Hasna',
      parrainage: true,
      id: '1',
      nom: 'boufahja',
      idCoach: '1',
      credit: 45,
      gacaoch: 0,
      gacummul: 6,
      gaparrainage: 10,
      gaweek: 7,
      numTelephone: '58447154',
      email: 'hasnaboufahga@gmail.com',
    ),
    Client(
      age: 23,
      prenom: 'Foued',
      parrainage: true,
      id: '2',
      nom: 'Hafnaoui',
      idCoach: '1',
      credit: 2,
      gacaoch: 14,
      gacummul: 0,
      gaparrainage: 10,
      gaweek: 7,
      numTelephone: '98547164',
      email: 'FouedHafnaoui@gmail.com',
    ),
    Client(
      age: 23,
      prenom: 'SeifEddine',
      parrainage: true,
      id: '0',
      nom: 'Bakkouri',
      idCoach: '',
      credit: 82,
      gacaoch: 4,
      gacummul: 20,
      gaparrainage:  0,
      gaweek: 7,
      numTelephone: '98547164',
      email: 'FouedHafnaoui@gmail.com',
    ),Client(
      age: 23,
      prenom: 'Souhail',
      parrainage: true,
      id: '3',
      nom: 'Jaballah',
      idCoach: '3',
      credit: 78,
      gacaoch: 8,
      gacummul: 24,
      gaparrainage: 0,
      gaweek: 7,
      numTelephone: '25787164',
      email: 'JaballahSouhail@gmail.com',
    ),*/
  ];
  String id = '-1';
  String incrementId() {
    id = (int.parse(id) + 1).toString();
    return id;
  }

  String newClient(
    String nom,
    String prenom,
    String email,
    String password,
    String phone,
  ) {
    String myId;
    myId = incrementId();
    _client.add(
      new Client(
          id: myId,
          email: email,
          nom: nom,
          prenom: prenom,
          numTelephone: phone,
          password: password),
    );

    notifyListeners();
    return (myId);
  }

  List<Client> get getData {
    return [..._client];
  }

  bool exist(String email, String password) {
    int i = 0;
    getData.forEach((element) {
      if (element.email == email && element.password == password) {
        i++;
      }
    });
    return i == 1;
  }

   currentId() async {
    print("hiiii");
    String id ;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String email = sharedPreferences.getString('email');
    if (email != null) {
      int i;
      for (i = 0; i < getData.length; i++) {
        if (getData[i].getEmail == email) {
           print("hiiii");
          id = getData[i].id;

        }
      }
    } 
     return id;
  }
 
}
