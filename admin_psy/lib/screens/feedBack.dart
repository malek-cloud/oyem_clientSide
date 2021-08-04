import 'package:admin_psy/screens/accueil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({Key key}) : super(key: key);

  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  _showSnackBar() {
    Get.snackbar(
      'Feedback Envoyé',
      'Merci pour votre effort',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey[300],
      snackStyle: SnackStyle.FLOATING,
      duration: Duration(seconds: 4),
    );
  }

  bool selecteda = false;
  bool selectedb = false;
  bool selectedc = true;
  bool selectedd = false;
  bool selectede = false;
  TextEditingController _controller = TextEditingController();
  var height = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).accentColor,
            title: Text('Feedback', style: TextStyle(color: Colors.white)),
            leading: IconButton(
              onPressed: () {
                Get.offAll(Accueil());
              },
              icon: Icon(CupertinoIcons.arrow_left, color: Colors.white),
            ),
          ),
          
          backgroundColor: Colors.grey[50],
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.green,
                    height: (MediaQuery.of(context).size.height - height) * 0.2,
                  ),
                  Container(
                    color: Colors.grey[50],
                    height: (MediaQuery.of(context).size.height - height) * 0.7,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    color: Colors.grey[50]),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Que ressenti vous envers notre app ! 😃",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[800],
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Divider(
                                  thickness: 2,
                                  endIndent: 30,
                                  indent: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selecteda = !selecteda;
                                            });
                                            if (selecteda) {
                                              setState(() {
                                                selectedb = false;
                                                selectedc = false;
                                                selectedd = false;
                                                selectede = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: selecteda
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.14,
                                            child: ColorFiltered(
                                              child: Image.asset(
                                                  'assets/terrible.png'),
                                              colorFilter: selecteda
                                                  ? ColorFilter.mode(
                                                      Colors.transparent,
                                                      BlendMode.color)
                                                  : ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.color),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Terrible',
                                          style: selecteda
                                              ? TextStyle(fontSize: 20)
                                              : null,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedb = !selectedb;
                                            });
                                            if (selectedb) {
                                              setState(() {
                                                selecteda = false;
                                                selectedc = false;
                                                selectedd = false;
                                                selectede = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: selectedb
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.14,
                                            child: ColorFiltered(
                                              child:
                                                  Image.asset('assets/sad.png'),
                                              colorFilter: selectedb
                                                  ? ColorFilter.mode(
                                                      Colors.transparent,
                                                      BlendMode.color)
                                                  : ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.color),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Triste',
                                          style: selectedb
                                              ? TextStyle(fontSize: 20)
                                              : null,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedc = !selectedc;
                                            });
                                            if (selectedc) {
                                              setState(() {
                                                selectedb = false;
                                                selecteda = false;
                                                selectedd = false;
                                                selectede = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: selectedc
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.14,
                                            child: ColorFiltered(
                                              child: Image.asset(
                                                  'assets/okay.png'),
                                              colorFilter: selectedc
                                                  ? ColorFilter.mode(
                                                      Colors.transparent,
                                                      BlendMode.color)
                                                  : ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.color),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Okay',
                                          style: selectedc
                                              ? TextStyle(fontSize: 20)
                                              : null,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedd = !selectedd;
                                            });
                                            if (selectedd) {
                                              setState(() {
                                                selectedb = false;
                                                selectedc = false;
                                                selecteda = false;
                                                selectede = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: selectedd
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.14,
                                            child: ColorFiltered(
                                              child: Image.asset(
                                                  'assets/good.png'),
                                              colorFilter: selectedd
                                                  ? ColorFilter.mode(
                                                      Colors.transparent,
                                                      BlendMode.color)
                                                  : ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.color),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Satisfait',
                                          style: selectedd
                                              ? TextStyle(fontSize: 20)
                                              : null,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectede = !selectede;
                                            });
                                            if (selectede) {
                                              setState(() {
                                                selectedb = false;
                                                selectedc = false;
                                                selectedd = false;
                                                selecteda = false;
                                              });
                                            }
                                          },
                                          child: Container(
                                            width: selectede
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2
                                                : MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.14,
                                            child: ColorFiltered(
                                              child:
                                                  Image.asset('assets/waw.png'),
                                              colorFilter: selectede
                                                  ? ColorFilter.mode(
                                                      Colors.transparent,
                                                      BlendMode.color)
                                                  : ColorFilter.mode(
                                                      Colors.white,
                                                      BlendMode.color),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Excellent',
                                          style: selectede
                                              ? TextStyle(fontSize: 20)
                                              : null,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Rédiger Votre feedback 🥰',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[800],
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
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
                                  //icon: Icon(Icons.email),
                                  hintText: 'Envoyer Votre Feedback',
                                ),
                                textInputAction: TextInputAction.done,
                                controller: _controller,
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                SystemChannels.textInput
                                    .invokeMethod('TextInput.hide');
                                _controller.text = '';

                                _showSnackBar();
                              },
                              backgroundColor: Theme.of(context).accentColor,
                              child: Icon(
                                Icons.send,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
