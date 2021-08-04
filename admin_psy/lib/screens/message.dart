import 'package:admin_psy/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/gotoaccueil.dart';
//import'../widgets/bottomNavBar.dart';

//import 'package:get/get.dart';
//import 'accueil.dart';
class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var heightAppBar = AppBar().preferredSize.height;
    return Scaffold(
      //bottomNavigationBar: BottomBarNavv(),
      drawer: MyDrawer(),
        appBar: AppBar(
          actions: [
         GotToAccueil(),
        ],
          backgroundColor: Theme.of(context).accentColor,
          title: Text(
            'Vos Chats',
          ),
          elevation: 0,
          /* leading: 
          Padding(
            padding: const EdgeInsets.only(left :8.0),
            child: CircleAvatar(
              backgroundImage :
               NetworkImage('https://cdn.futura-sciences.com/buildsv6/images/wide1920/3/6/0/36006517b2_50166642_mz.jpg', ),
              
            ),
          ),*/

          /* actions: [
            IconButton(
          onPressed: (){
            Get.off(Accueil());
          },
         icon: Icon(Icons.arrow_right_alt_rounded, size : 60), ),
        ],*/
        ),
        backgroundColor: Theme.of(context).accentColor,
        body: MessageScreenBody());
  }
}

class MessageScreenBody extends StatelessWidget {
  const MessageScreenBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
            topLeft: Radius.circular(60),
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus ,
                  child: Container(
            padding: EdgeInsets.all(17),
            child: Column(
              
              children: [
                Expanded(
                  child: ListView(
                    reverse: true,
                    children: [
                      Container(
                        
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius : BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        
                        height: 60,
                        child: Text('khgkb', softWrap : true),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.green[100],
                        height: 60,
                        child: Text('khgkb'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.emoji_emotions_rounded)),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: 'send a message ...'),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.send),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
