import 'package:admin_psy/providers/clientProv.dart';
import 'package:admin_psy/screens/accueil.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  String _email;
  TextEditingController _password = TextEditingController();
  TextEditingController _email1 = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    f1.dispose();
    f2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final client = Provider.of<ClientProv>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Image.asset('assets/couverture.jpg'),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                      icon: Icon(Icons.email),
                      hintText: 'Adresse Email',
                    ),
                    focusNode: f1,
                    controller: _email1,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(f2);
                    },
                    textInputAction: TextInputAction.next,
                    validator: (value) => EmailValidator.validate(value)
                        ? null
                        : "Entrez un Email Valide Svp",
                    onSaved: (String value) {
                      _email = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
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
                      icon: Icon(Icons.password),
                      hintText: 'Mot de passe',
                    ),
                    textInputAction: TextInputAction.done,
                    focusNode: f2,
                    controller: _password,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre numéro de télephone svp';
                      } else if (value.length < 6) {
                        return 'Minimum 6 caractères';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        print(_email1.text);
                        print(_password.text);
                        print([_email1.text, _password.text]);
                        if (client.exist(_email1.text, _password.text)) {
                          final SharedPreferences sharedPreferences =
                              await SharedPreferences.getInstance();
                          sharedPreferences.setString('email', _email1.text);
                          sharedPreferences.setString(
                              'password', _password.text);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Accueil(),
                            ),
                          );
                        } else {
                          print('this data doesn\'t exist ');
                        }
                      } else {
                        print('didnt work');
                      }
                    },
                    child: Text(
                      'Se connecter',
                      style: TextStyle(fontSize: 25),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
