import 'package:admin_psy/screens/load.dart';
import 'package:flutter/material.dart';
import 'providers/employeeProv.dart';
import 'package:provider/provider.dart';
import 'providers/articleProv.dart';
import 'package:get/get.dart';
import 'providers/clientProv.dart';
 main(){
   runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ArticleProv()),
        ChangeNotifierProvider.value(value: EmployeeProv()),
        ChangeNotifierProvider.value(value: ClientProv()),
      ],
      child:  GetMaterialApp(
          title: 'Client Side',
          theme: ThemeData(
            primaryColor: Colors.grey[800],
            accentColor: Colors.green,
          ),
          home: Load(),
          debugShowCheckedModeBanner: false,
          /* routes: {
            ProfileEmp.routeName : (ctx) => ProfileEmp() ,
          },*/
        ),
      
    );
  }
}
