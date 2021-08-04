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
  Map<String, String> likes = {};
  Map<Object, Object> commentaire = {};
  List partage;
  Map<String, String> ajoutFav = {};

  Article({
   // this.like,
    @required this.id,
    @required this.titre,
    @required this.contenu,
    this.alerte,
    this.image,
    @required this.datePublication,
    @required this.autheur,
    this.ajoutFav,
    this.commentaire,
   // this.favourite,
    this.likes,
    this.partage,
  });

  void aimer(Client client) {
    if (this.likes.containsKey(client.id)) {
      this.likes.remove(client.id);
    //  this.like = false ;
    } else {
      this.likes[client.id] = client.prenom + client.nom;
     // this.like = true ;
    }
    notifyListeners();
  }
  
  void commenter(Client client, Commentaire commentaire){
    this.commentaire[client]=[commentaire];
    notifyListeners();
  }

  void ajouterFavoris(Client client){
    if (this.ajoutFav.containsKey(client.id)) {
      this.ajoutFav.remove(client.id);
    } else {
      this.ajoutFav[client.id] = client.prenom + client.nom;
    }
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