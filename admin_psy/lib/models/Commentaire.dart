import 'employee.dart';
import 'visiteur.dart';
import '../providers/article.dart';

class Commentaire {
  String id, contenu;
  Visiteur autheur;
  Article articleCorrespondant;
  List<Map<Object, String>> reponses;
  DateTime date;
  Commentaire({
    this.id,
    this.autheur,
    this.articleCorrespondant,
    this.contenu,
    this.date,
    this.reponses,
  });
}
