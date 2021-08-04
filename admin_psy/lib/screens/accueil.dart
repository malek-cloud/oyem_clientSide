//import'../widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/drawer.dart';
import '../widgets/detailedArticle.dart';
import 'package:provider/provider.dart';
import '../providers/articleProv.dart';
import 'package:admin_psy/models/employee.dart';
import 'package:admin_psy/providers/employeeProv.dart';
import '../widgets/detailedEmployee.dart';

class Accueil extends StatefulWidget {
  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: SnackBar(content: content),
      appBar: AppBar(
        title: Text(
          'Oyem',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        actions: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_active),
                tooltip: 'View Notifications',
                onPressed: () {
                  // handle the press
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Search for something',
                onPressed: () {
                  // handle the press
                },
              ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: BottomBarNavv(),
      drawer: MyDrawer(),

      backgroundColor: Theme.of(context).accentColor,
      body: ListingArticles(),
    );
  }
}

class ListingArticles extends StatefulWidget {

  @override
  _ListingArticlesState createState() => _ListingArticlesState();
}

class _ListingArticlesState extends State<ListingArticles> {
  @override
  Widget build(BuildContext context) {
    List<Employee> employers = Provider.of<EmployeeProv>(context).employees;
    final articlesData = Provider.of<ArticleProv>(context);
    final art = articlesData.itemsGetter;
    return ChangeNotifierProvider.value(
      value: Employee(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7),
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, j) {
                  return StoryEmployee(
                    employers[j].id,
                  );
                },
                itemCount: employers.length,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: art.length,
                itemBuilder: (context, i) {
                  return ListItem(
                    idArticle: art[i].id,
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
