import 'package:admin_psy/widgets/detailedArticle.dart';
import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  final String id;
  const Favorite({this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back, color: Colors.black,)),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: ListItem(
            idArticle: id,
          ),
        ),
      ),
    );
  }
}
