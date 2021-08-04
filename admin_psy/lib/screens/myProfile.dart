import 'dart:async';
import 'dart:convert';
import 'package:admin_psy/widgets/changeCoach.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:admin_psy/screens/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/gotoaccueil.dart';
import '../widgets/drawer.dart';
import '../models/paymentCard.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  static const String _tokenURL =
      'https://sandbox.paymee.tn/api/v1/payments/create';
  static const String _token_key =
      'Token 7930064a52f597e1902b06302450d0cd7aefb779';
  //static const String _private_key = '';
  static const Map<String, String> _header = {
    "Content-Type": "application/json",
    'Authorization': _token_key,
  };

  String credit = '0';

  TextEditingController _points = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  FocusNode f1 = FocusNode();

  @override
  void dispose() {
    f1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomBarNavv(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        title: Center(
            child: Text(
          'client name',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 23),
        )),
        actions: [
          GotToAccueil(),
        ],
      ),
      backgroundColor: Theme.of(context).accentColor,
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.height * 0.18,
                  child: Image.network(
                      'http://img.over-blog-kiwi.com/1/81/49/18/20151027/ob_aee1cb_avril-lavigne-avril-lavigne-22661429-1.jpg',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.grey[50],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Votre coach est : \n' + 'foulen ben foulen',
                            style: TextStyle(fontSize: 20),
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Get.to(Messages());
                                },
                                child: Text('Texter'),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Theme.of(context).accentColor),
                                ),
                              ),
                              ChangeCoach(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Colors.grey[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Votre crédits : ' + credit,
                                style: TextStyle(fontSize: 20),
                              ),
                              myButton(context),
                            ],
                          ),
                          Text(
                            'Give Away Coach : ' + '0',
                            style: TextStyle(fontSize: 19),
                          ),
                          Text(
                            'Give Away Week : ' + '7',
                            style: TextStyle(fontSize: 19),
                          ),
                          Text(
                            'Give Away Cummul : ' + '12',
                            style: TextStyle(fontSize: 19),
                          ),
                          Text(
                            'Give Away Parrainage : ' + '0',
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Colors.grey[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Code Parrainage : ' + '45465',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      color: Colors.grey[50],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vos Articles Préférés :',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget myButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return SingleChildScrollView(
                // reverse: true ,
                padding: EdgeInsets.only(
                    top: f1.hasFocus
                        ? MediaQuery.of(context).size.height * 0.1
                        : MediaQuery.of(context).size.height * 0.18),
                child: AlertDialog(
                  scrollable: true,
                  insetPadding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.11,
                    right: MediaQuery.of(context).size.width * 0.11,
                    //bottom: MediaQuery.of(context).size.height * 0.30
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextFormField(
                        focusNode: f1,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: Colors.grey[800],
                              width: 2.0,
                            ),
                          ),
                          icon: Icon(Icons.money),
                          hintText: 'Nombre de points',
                        ),
                        textInputAction: TextInputAction.done,
                        controller: _points,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Veuillez saisir un nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Combien de point crédit voulez vous obtenir',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.grey[800]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '.. 4 points = 1DT ..',
                        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          payment();
                        } else {
                          print('No');
                        }
                      },
                      child: Text(
                        'Payer',
                        style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Text('Acheter'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
      ),
    );
  }

  Future<String> _getToken(PaymentCard card) async {
    http.Response response = await http.post(Uri.parse(_tokenURL),
        headers: _header,
        body: jsonEncode(
            {"vendor": card.vendor, "amount": card.amount, "note": card.note}));
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        return data['data']['token'];
        break;
      default:
        throw Exception('Invalid Card');
    }
  }

  payment() async {
    StreamSubscription<String> _onStateChanged;
    final flutterWebviewPlugin = new FlutterWebviewPlugin();
    PaymentCard card = PaymentCard(
        vendor: '1898',
        amount: (int.parse(_points.text) * (1 / 4)).toString(),
        note: 'Order #1000132');

    String token = await _getToken(card);
    String url = 'https://sandbox.paymee.tn/gateway/$token';
    if (token != null) {
      flutterWebviewPlugin.launch(url);

      _onStateChanged =
          flutterWebviewPlugin.onUrlChanged.listen((String url) async {
        if (url.contains('/loader')) {
          flutterWebviewPlugin.hide();
          http.Response response = await http.get(
            Uri.parse('https://sandbox.paymee.tn/api/v1/payments/$token/check'),
            headers: _header,
          );

          if (response.statusCode == 200) {
            flutterWebviewPlugin.close();
            var data = jsonDecode(response.body);

            if (data['data']['payment_status']) {
              setState(() {
                credit =
                    (int.parse(credit) + int.parse(_points.text)).toString();
                _points.text = '';
              });
              Get.offAll(MyProfile());
              _showSnackBar();
            }
          } else {
            throw Exception('Card invalid');
          }
        }
      });
    }
  }
}
_showSnackBar() {
    Get.snackbar(
      'Payment effectué avec Succés',
      'le nombre de vos credit à été bien mis à jour',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[300],
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: 4),
    );
  }
