import 'package:flutter/foundation.dart';
class Employee with ChangeNotifier{
  final String id ;
  final String nom ;
  final String prenom ;
  final String numtlphn ;
  final String email ;
  final String situationfamiliale;
  final String numCNSS ;
  final String cv ;
  final String resume ;
  final String lettremotivation ;
  final String typecontrat ;
  final String attestation;
  final String b3 ;
  final String diplome;
  final String extraitnaiss;
  final String rib ;
  final String citationPref ;
  String formationaccomplies ;
  String formationnonaccomplie ;
  final String photo ;
  List liens ;
  Employee({ this.resume, this.id,  this.prenom , this.nom, this.numCNSS,  this.numtlphn, 
   this.email, this.attestation, this.b3, this.cv, this.diplome, this.extraitnaiss,
   this.formationaccomplies, this.formationnonaccomplie, this.lettremotivation, this.liens, this.photo, 
   this.rib, this.situationfamiliale, this.typecontrat,this.citationPref});

}
