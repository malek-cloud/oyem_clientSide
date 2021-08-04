import 'package:flutter/material.dart';
import '../screens/accueil.dart';
import 'package:get/get.dart';

class GotToAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.off(Accueil());
      },
      icon: Icon(
        Icons.arrow_forward,
        size: 25,
      ),
    );
  }
}
