import 'package:admin_psy/models/employee.dart';
import 'package:admin_psy/providers/employeeProv.dart';
import 'package:admin_psy/widgets/coachForChange.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeCoach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Employee> employers = Provider.of<EmployeeProv>(context).employees;
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Choisir un nouveau Coach'),
                  content: Container(
                    width: double.minPositive,
                 // height: 300,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: employers.length,
                        itemBuilder: (context, i) {
                          return CoachForChange(
                            employers[i].id,
                          );
                        }),
                  ),
                );
              });
        },
        child: Text('changer'));
  }
}
