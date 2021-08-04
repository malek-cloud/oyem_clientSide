import 'package:admin_psy/providers/article.dart';
import 'package:admin_psy/providers/employeeProv.dart';
import '../widgets/gotoaccueil.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/employeeProv.dart';
import '../providers/articleProv.dart';
import '../widgets/detailedArticle.dart';
import '../widgets/drawer.dart';
class ProfileEmp extends StatefulWidget {
  String idEmp;
  ProfileEmp(this.idEmp);

  @override
  _ProfileEmpState createState() => _ProfileEmpState();
}

class _ProfileEmpState extends State<ProfileEmp> {
  bool showResume = false;
  bool showformation = false;
  bool showPrivateData = false;
  void resume() {
    setState(() {
      showResume = !showResume;
    });
  }

  void formation() {
    setState(() {
      showformation = !showformation;
    });
  }

  Widget build(BuildContext context) {
    //final empId =  ModalRoute.of(context).settings.arguments as String ;
    final loadedEmployee = Provider.of<EmployeeProv>(context, listen: false)
        .findById(widget.idEmp);
    List<Article> loadedArticles =
        Provider.of<ArticleProv>(context).employeeArticle(widget.idEmp);
    return Scaffold(
    //  bottomNavigationBar: BottomBarNavv(),
      appBar: AppBar(
        actions: [
          GotToAccueil(),
        ],
        elevation: 0,
        title:
            Text('Profile ' + loadedEmployee.prenom + " " + loadedEmployee.nom),
        backgroundColor: Theme.of(context).accentColor,
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).accentColor,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 8, left: 20, right: 20),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset(
                          'assets/couverture.jpg',
                         fit: BoxFit.fitWidth,
                        ),
                      ),
                 
                      Container(
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            loadedEmployee.photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                ],
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Divider(
              thickness: 2,
              indent: 30,
              endIndent: 30,
              color: Colors.black,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              loadedEmployee.prenom + " " + loadedEmployee.nom,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              //height: 30,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Résumé',
                        style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: resume,
                        icon: Icon(
                          showResume
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  showResume ? Text(loadedEmployee.resume) : Container(),
                ],
              ),
            ),
            Container(
              // height: 30,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[100],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Formation Accomplies',
                        style: TextStyle(
                            fontSize: 17,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: formation,
                          icon: Icon(
                            showformation
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 20,
                          ))
                    ],
                  ),
                  showformation
                      ? Text(loadedEmployee.formationaccomplies)
                      : Container(),
                ],
              ),
            ),
            loadedArticles.length == 0
                ? Container()
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: loadedArticles.length,
                      itemBuilder: (context, i) {
                        return ListItem(
                          idArticle: loadedArticles[i].id,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
