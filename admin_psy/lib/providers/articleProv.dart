import 'package:flutter/material.dart';
import '../providers/article.dart';
import '../models/employee.dart';
class ArticleProv with ChangeNotifier{
  List<Article> _itemArticle = [
  Article(autheur: new Employee(id: '0', prenom: 'Malek', nom: 'Guedda', numtlphn: '26995159', 
email: 'malekguedda@oyem.tn', photo: 'https://cdn.futura-sciences.com/buildsv6/images/wide1920/3/6/0/36006517b2_50166642_mz.jpg'), id: '0', titre: 'oyem eyes', 
contenu: "fondé sur les principes d’accès des mouvements oculaires découverts par Robert Dilts, mis  en forme par John Grinder et Richard Bandler et organisés par Connirae et Steven  Andreas, la Stimulation Bilatérale est fort utile pour le traitement des traumatismes", 
datePublication: DateTime.now(),
 image: 'https://cdn.pixabay.com/photo/2018/09/22/20/09/galaxy-3696061_960_720.jpg'),

 Article(autheur: new Employee(id: '1', prenom: 'Ahmed', nom: 'Chouikh', numtlphn: '27855159', 
email: 'contact@oyem.tn', photo: 'https://img-0.journaldunet.com/-QoWG0KSm58Lx_89t-MyqN2SCo0=/1500x/smart/d3fbc4cec1184654bda9e3429cfb54f2/ccmcms-jdn/23932421.jpeg'), id: '1', titre: 'oyem experience', 
contenu: "fondé sur les principes d’accès des mouvements oculaires découverts par Robert Dilts, mis  en forme par John Grinder et Richard Bandler et organisés par Connirae et Steven  Andreas, la Stimulation Bilatérale est fort utile pour le traitement des traumatismes", 
datePublication: DateTime.now(), image: 'https://st.depositphotos.com/1288351/3083/i/600/depositphotos_30835497-stock-photo-woman-lifting-her-hands-up.jpg'),
 Article(autheur: new Employee(id: '1', prenom: 'Ahmed', nom: 'Chouikh', numtlphn: '27855159', 
email: 'contact@oyem.tn', photo: 'https://img-0.journaldunet.com/-QoWG0KSm58Lx_89t-MyqN2SCo0=/1500x/smart/d3fbc4cec1184654bda9e3429cfb54f2/ccmcms-jdn/23932421.jpeg'), id: '7', titre: 'oyem experience', 
contenu: "fondé sur les principes d’accès des mouvements oculaires découverts par Robert Dilts, mis  en forme par John Grinder et Richard Bandler et organisés par Connirae et Steven  Andreas, la Stimulation Bilatérale est fort utile pour le traitement des traumatismes", 
datePublication: DateTime.now(), image: 'https://st.depositphotos.com/1288351/3083/i/600/depositphotos_30835497-stock-photo-woman-lifting-her-hands-up.jpg'),

Article(autheur: new Employee(id: '2', prenom: 'Mariem', nom: 'mekki', numtlphn: '98855159', 
email: 'mariem@oyem.tn', photo: 'https://upload.wikimedia.org/wikipedia/commons/a/af/Bill_Gates_-_Nov._8%2C_2019.jpg'), id: '2', titre: 'oyem marketing', 
contenu: "Fondé sur les principes d’accès des mouvements oculaires découverts par Robert Dilts, mis  en forme par John Grinder et Richard Bandler et organisés par Connirae et Steven  Andreas, la Stimulation Bilatérale est fort utile pour le traitement des traumatismes", 
datePublication: DateTime.now(), image: 'https://thumbs.dreamstime.com/b/homme-avec-l-art-de-corps-spirituel-36530599.jpg'),
];
  List<Article> get itemsGetter {
    return [..._itemArticle] ;
  } 
  List<Article> employeeArticle( String id){
    var i ; 
    List<Article> l = [];
    for(i=0 ; i<_itemArticle.length ; i++ ){
      if(_itemArticle[i].autheur.id == id){
        l.add(_itemArticle[i]);
      }
    }
    return l ;
    //notifyListeners();
  }

Article findById(String id){
  return _itemArticle.firstWhere((article) => article.id == id );
}

}
 