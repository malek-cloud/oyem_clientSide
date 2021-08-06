import 'package:admin_psy/conf.dart';
import 'package:admin_psy/models/client.dart';
import 'package:admin_psy/providers/articleProv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String id;
  Future<void> myId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String _id = sharedPreferences.getString('myId');
    id = _id;
  }

  @override
  void initState() {
    myId();
    if (id != null && id != '-1') {
      print(id.toString() + ' :  hedha el id mte3i');
    }
    super.initState();
  }

  bool fav = false;
  Client currentClient(String id) {
    Client myClient = Client();
    client.forEach((element) {
      if (element.id == id) {
        myClient = element;
      }
    });
    return myClient;
  }

  bool aime = false;
  @override
  Widget build(BuildContext context) {
    Article art = Provider.of<ArticleProv>(context).findById(widget.idArticle);
    // Client user = Provider.of<ClientProv>(context).findById(id);
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: EdgeInsets.all(15),
      //color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            id != null ? CircularProgressIndicator() : Container(),
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
                    //print(currentClient(id));
                    currentClient(id).ajouterFavoris(art.id);
                    setState(() {
                      fav = !fav;
                    });
                    print(currentClient(id).favArticles);
                    Get.snackbar('Succès',
                       fav ? 'Cet Article à été ajouter à la liste de vos articles préférés' : 'l\'article à été enlevé de votre liste d\'articles préférés',
                        duration: Duration(seconds: 3),
                        snackPosition: SnackPosition.BOTTOM,
                        isDismissible: true,
                        backgroundColor : Colors.black38,
                        dismissDirection: SnackDismissDirection.HORIZONTAL);

                  },
                  icon: Icon(
                    fav ? Icons.star_rounded : Icons.star_border_purple500,
                    size: 30,
                  ),
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
                    GestureDetector(
                      onTap: () {
                        return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context,
                                            rootNavigator: true)
                                        .pop('dialog'),
                                    child: Text('okay'),
                                  ),
                                ],
                                title:
                                    Text('personnes qui ont aimés cet article'),
                                content: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    width: double.minPositive,
                                    child: art.likes.length <= 0
                                        ? Container()
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: art.likes.length,
                                            itemBuilder: (context, i) {
                                              List<String> likers = [];
                                              print(art.likes);
                                              client.forEach((element) {
                                                if (art.likes
                                                    .contains(element.id)) {
                                                  likers.add(element.nom +
                                                      ' ' +
                                                      element.prenom);
                                                } else {
                                                  return Text(
                                                      'no elements there');
                                                }
                                                print(element.id);
                                              });
                                              print(likers);
                                              return Text(
                                                likers[i],
                                                softWrap: true,
                                              );
                                            },
                                          )),
                              );
                            });
                      },
                      child: Text(
                        art.likes.length.toString(),
                      ),
                    ),
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
                  onPressed: () {},
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          print(id);
                          setState(() {
                            aime = art.aimer(id);
                          });
                        },
                        icon: Icon(
                          aime
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_outlined,
                          size: 25,
                          color: Colors.red,
                        ),
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
