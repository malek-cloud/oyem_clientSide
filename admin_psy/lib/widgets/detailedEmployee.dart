import 'package:admin_psy/models/employee.dart';
import 'package:admin_psy/providers/employeeProv.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../screens/profileEmployee.dart';
class StoryEmployee extends StatelessWidget {
  String id ;
  StoryEmployee(this.id);
  @override
  Widget build(BuildContext context) {
    final Employee employer = Provider.of<EmployeeProv>(context).findById(id);
    return GestureDetector(
      onTap: ()
          {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ProfileEmp(id,))) ;
          },
          child: Container(
            
        margin: EdgeInsets.only(left: 10, top: 15, bottom: 8),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: 120,
        //height: 90,
        decoration: BoxDecoration(
          color : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Container(
                width: 33,
                height: 33,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(employer.photo, fit: BoxFit.cover,),
                ),
              ),
              
              Text(employer.prenom, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),

              ],
              
            ),
            SizedBox(
              height: 8,

            ),
            Text(employer.citationPref)
          ],
        ),
      ),
    );
  }
}