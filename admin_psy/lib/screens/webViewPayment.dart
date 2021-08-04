import 'package:admin_psy/screens/myProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class Pay extends StatelessWidget {
  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.leave_bags_at_home),
          onPressed: () {
            Get.off(MyProfile());
          },
        ),
        title: Text('Payement'),
      ),
      body: WebviewScaffold(
          url: "https://www.google.com",
          appBar: new AppBar(
            title: new Text("Widget webview"),
          ),
          hidden: true,
          withZoom: true,
  
        ),
    );
  }
}
