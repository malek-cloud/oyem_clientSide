import 'package:flutter/material.dart';
class OneGrid extends StatelessWidget {
  String title  ; 
  Widget icon ;
 
  OneGrid({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                                      child: Container(
                      color: Colors.grey[100],
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon,
                            SizedBox(
                              height: 10,
                            ),
                            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 17), textAlign: TextAlign.center,),
                            
                          ],
                        ),
                      ),
                    ),
                  );
  }
}