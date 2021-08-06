import 'package:admin_psy/models/Commentaire.dart';
import 'package:admin_psy/models/client.dart';
import 'package:flutter/foundation.dart';
import '../models/employee.dart';
import '../models/client.dart';

class Article with ChangeNotifier {
  final String id;
  final String titre;
  final String contenu;
  final String alerte;
  final String image;
//  bool like = false ;
  final DateTime datePublication;
  final Employee autheur;
  // bool favourite;

  Map<Object, Object> commentaire = {};
  List partage;
  //Map<String, String> ajoutFav = {};
  final List<String> likes;

  Article({
    this.likes,
    @required this.id,
    @required this.titre,
    @required this.contenu,
    this.alerte,
    this.image,
    @required this.datePublication,
    @required this.autheur,
    //this.ajoutFav,
    this.commentaire,
    // this.favourite,

    this.partage,
  });

  bool aimer(String id) {
    print(this.likes.contains(id));
    if (this.likes.contains(id)) {
      this.likes.remove(id);
      notifyListeners();
      return false;
    } else {
      this.likes.add(id);
      notifyListeners();

      return true;
    }
  }

  void commenter(Client client, Commentaire commentaire) {
    this.commentaire[client] = [commentaire];
    notifyListeners();
  }

 

  /*Future<void> share(dynamic link, String title) async{
    await FlutterShare.share(
      title:'Oyem Unity',
      text : title,
      linkUrl: link,
      chooserTitle: 'Ou voulez vous partager ce lien'
    );
  }*/

}
