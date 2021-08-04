import 'package:admin_psy/models/employee.dart';
import 'package:admin_psy/providers/employeeProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachForChange extends StatelessWidget {
  final String id;
  CoachForChange(this.id);

  @override
  Widget build(BuildContext context) {
    final Employee employer = Provider.of<EmployeeProv>(context).findById(id);
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(employer.prenom + ' ' + employer.nom),
            CircleAvatar(
              backgroundImage: NetworkImage(employer.photo),
            ),
          ],
        ),
      ),
    );
  }
}
