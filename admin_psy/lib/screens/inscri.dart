import 'package:admin_psy/providers/clientProv.dart';
import 'package:admin_psy/screens/accueil.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import '../conf.dart';

class Inscri extends StatefulWidget {
  @override
  _InscriState createState() => _InscriState();
}

class _InscriState extends State<Inscri> {
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();
  FocusNode f7 = FocusNode();
  String myId ;
  bool _checkcondition = false;
  bool _checkOffre = false;
  String _nom, _prenom, _email, _phone;
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email1 = TextEditingController();
  TextEditingController _nom1 = TextEditingController();
  TextEditingController _prenom1 = TextEditingController();
  TextEditingController _confimPassword = TextEditingController();
  TextEditingController _phone1 = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    f1.dispose();
    f2.dispose();
    f3.dispose();
    f4.dispose();
    f5.dispose();
    f6.dispose();
    f7.dispose();
    super.dispose();
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(1920),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.green,
                onPrimary: Colors.white,
                surface: Colors.green,
                onSurface: Colors.grey[800],
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  @override
  Widget build(BuildContext context) {
    final clients = Provider.of<ClientProv>(context, listen: false);
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
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
                      icon: Icon(Icons.person),
                      hintText: 'Nom',
                    ),
                    textInputAction: TextInputAction.next,
                    focusNode: f1,
                    controller: _nom1,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(f2);
                    },
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre nom svp';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _nom = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
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
                      icon: Icon(Icons.person),
                      hintText: 'Prénom',
                    ),
                    focusNode: f2,
                    controller: _prenom1,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(f7);
                    },
                    textInputAction: TextInputAction.next,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre prenom svp';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _prenom = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
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
                      icon: Icon(Icons.date_range),
                      hintText: 'Date de Naissance',
                    ),
                    focusNode: f7,
                    controller: _textEditingController,
                    onTap: () {
                      _selectDate(context);
                    },
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(f3);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre date de naissance svp';
                      }
                      return null;
                    },
                    /*onSaved: (String value) {
                      _prenom = value;
                    },*/
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
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
                    focusNode: f3,
                    controller: _email1,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(f4);
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          color: Colors.grey[800],
                          width: 2.0,
                        ),
                      ),
                      icon: Icon(Icons.phone),
                      hintText: 'Numéro de Telephone',
                    ),
                    focusNode: f4,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(f5);
                    },
                    textInputAction: TextInputAction.next,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre numéro de télephone svp';
                      } else if (value.length < 8 || value.length > 14) {
                        return 'Entrez un numéro valide';
                      }
                      return null;
                    },
                    controller: _phone1,
                    onSaved: (String value) {
                      _phone = value;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
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
                    textInputAction: TextInputAction.next,
                    focusNode: f5,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(f6);
                    },
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
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
                      hintText: 'Confimer votre mot de passe',
                    ),
                    textInputAction: TextInputAction.done,
                    focusNode: f6,
                    controller: _confimPassword,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir votre numéro de télephone svp';
                      } else if (_confimPassword.text != _password.text) {
                        return 'Veuillez vérifier la confirmation';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Parrainer(),
                CheckboxListTile(
                  value: _checkcondition,
                  onChanged: (bool value) {
                    setState(() {
                      _checkcondition = value;
                    });
                  },
                  activeColor: Colors.green,
                  title: Text(
                    'J\'accepte les conditions générale',
                    softWrap: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CheckboxListTile(
                    value: _checkOffre,
                    onChanged: (bool value) {
                      setState(() {
                        _checkOffre = value;
                      });
                    },
                    activeColor: Colors.green,
                    title: Text(
                      'J\'accepte de recevoir les promotions et les offres de oyem unity',
                      softWrap: true,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        myId = clients.newClient(
                          _nom1.text,
                          _prenom1.text,
                          _email1.text,
                          _password.text,
                          _phone1.text,
                        );
                        print('this is myId : ' + myId.toString());
                        print(client.toString());
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString('email', _email1.text);
                        sharedPreferences.setString('myId', myId);
                        sharedPreferences.setString('password', _password.text);
                        sharedPreferences.setString('prenom', _prenom1.text);
                        sharedPreferences.setString('nom', _nom1.text);
                        sharedPreferences.setString('phone', _phone1.text);
                        int i ;
                        for (i = 0;i<clients.getData.length ;i++){
                          
                          print(clients.getData[i].email);
                          print(clients.getData[i].id);
                          print(clients.getData[i].password);
                          print(clients.getData[i].nom);
                          print(clients.getData[i].prenom);
                          print(clients.getData[i].numTelephone);
                        }
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Accueil(),
                          ),
                        );
                      } else {
                        print('didnt work');
                      }
                    },
                    child: Text(
                      'Créer',
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

class Parrainer extends StatefulWidget {
  const Parrainer({
    Key key,
  }) : super(key: key);

  @override
  _ParrainerState createState() => _ParrainerState();
}

class _ParrainerState extends State<Parrainer> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FocusNode f1 = FocusNode();
  @override
  void dispose() {
    f1.dispose();
    super.dispose();
  }

  TextEditingController _code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Dialog(
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text('Code Parrainage du récepteur',softWrap: true,textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.grey[800]),),
                          Form(
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
                                  hintText: 'Code',
                                ),
                                textInputAction: TextInputAction.done,
                                controller: _code,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Veuillez saisir le code';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Annuler'),
                                style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Parrainer'),
                                style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),

                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Text(
          'Parrainer',
          style: TextStyle(fontSize: 22),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
      ),
    );
  }
}
