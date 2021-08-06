import 'package:admin_psy/models/client.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../conf.dart';

class ClientProv with ChangeNotifier {
  
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
    client.add(
      new Client(
          id: myId,
          email: email,
          nom: nom,
          prenom: prenom,
          numTelephone: phone,
          password: password,
          favArticles : []),
          
    );

    notifyListeners();
    return (myId);
  }

  List<Client> get getData {
    return client;
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
    print("hedha email : "+ email != null);
    if (email != null) {
      int i;
      print(client);
      print(client.length.toString());
      
      for (i = 0; i < client.length; i++) {
        print("hedha email 2 : "+ client[i].getEmail +" ==="+email);
        if (client[i].getEmail == email) {
           print("hiiii 2");
          id = client[i].id;

        }
      }
    } 
     return id;
  }
  Client findById(String id){
  return client.firstWhere((user) => user.id == id );
}
 
}
