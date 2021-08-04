import 'package:admin_psy/providers/articleProv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/profileEmployee.dart';
import 'package:provider/provider.dart';
import '../providers/article.dart';
import '../providers/clientProv.dart';
class ListItem extends StatefulWidget {
  final String idArticle;
  ListItem({
    this.idArticle,
  });

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  var id ;
  @override
  void initState() {
    id =ClientProv().currentId();
    if(id !=null || id !='-1'){
      print(id.toString() + ' :  hedha el id mte3i');
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Article art = Provider.of<ArticleProv>(context).findById(widget.idArticle);

    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(15),
      //color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          art.autheur.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ProfileEmp(art.autheur.id)));
                          },
                          child: Text(
                            art.autheur.prenom + " " + art.autheur.nom,
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(art.datePublication.toString())
                      ],
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    print('done');
                  },
                  icon: Icon(Icons.star_border_purple500_rounded, size: 30),
                ),
              ],
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                art.titre,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            GestureDetector(
              onDoubleTap: () {
                print('i like this');
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(art.contenu),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          art.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Text('42'),
                  ],
                ),
                Text('14 commentaires'),
                Text('3 partages'),
              ],
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    print('commenter');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.comment,
                        size: 25,
                        color: Colors.grey[900],
                      ),
                      //Text('Commenter', style : TextStyle(fontSize : 14)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('AjoutFav');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        size: 25,
                        color: Colors.grey[900],
                      ),
                      //Text('Ajouter Aux favoris', style : TextStyle(fontSize : 14, color: Colors.purple[900])),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print('partager');
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.share,
                        size: 25,
                        color: Colors.grey[900],
                      ),
                      // Text('Partager', style : TextStyle(fontSize : 14)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
