import 'package:admin_psy/models/employee.dart';
import 'package:flutter/material.dart';
class EmployeeProv with ChangeNotifier{
   List<Employee> _employees = [
   Employee(id: '2', prenom: 'mariem', numtlphn: '98855159', nom : 'mekki',
   citationPref: 'La vie est un flambeau toujours prêt à s\'éteindre',
email: 'mariem@oyem.tn', 
formationaccomplies: 'Une partie dans le profil \n du client dans back office pour que \n dans le choix du client du changement de coach, \n il peut trouver comment s’orienter.',
resume : 'Une partie dans le profil du client dans back office pour que dans le choix du client du changement de coach, il peut trouver comment s’orienter.',
photo: 'https://upload.wikimedia.org/wikipedia/commons/a/af/Bill_Gates_-_Nov._8%2C_2019.jpg'),
Employee(id: '1', prenom: 'Ahmed', numtlphn: '27855159', nom : 'Chouikh',
citationPref: 'La vie est un flambeau toujours prêt à s\'éteindre',
email: 'contact@oyem.tn', 
formationaccomplies: 'Une partie dans le profil \n du client dans back office pour que \n dans le choix du client du changement de coach, \n il peut trouver comment s’orienter.',
resume : 'Une partie dans le profil du client dans back office pour que dans le choix du client du changement de coach, il peut trouver comment s’orienter.',
photo: 'https://img-0.journaldunet.com/-QoWG0KSm58Lx_89t-MyqN2SCo0=/1500x/smart/d3fbc4cec1184654bda9e3429cfb54f2/ccmcms-jdn/23932421.jpeg'),
Employee(id: '0', prenom: 'Malek', numtlphn: '26995159', nom : 'Guedda',
citationPref: 'La vie est un flambeau toujours prêt à s\'éteindre',
resume : 'Une partie dans le profil du client dans back office pour que dans le choix du client du changement de coach, il peut trouver comment s’orienter.',
email: 'malekguedda@oyem.tn',
formationaccomplies: 'Une partie dans le profil \n du client dans back office pour que \n dans le choix du client du changement de coach, \n il peut trouver comment s’orienter.',
 photo: 'https://cdn.futura-sciences.com/buildsv6/images/wide1920/3/6/0/36006517b2_50166642_mz.jpg'),
 Employee(id: '3', prenom: 'Ayoub', numtlphn: '47855159', nom: 'Yousfi', 
 citationPref: 'La vie est un flambeau toujours prêt à s\'éteindre',
 formationaccomplies: 'Une partie dans le profil \n du client dans back office pour que \n dans le choix du client du changement de coach, \n il peut trouver comment s’orienter.',
 resume : 'Une partie dans le profil du client dans back office pour que dans le choix du client du changement de coach, il peut trouver comment s’orienter.',
email: 'contact@oyem.tn', 
photo: 'https://img-0.journaldunet.com/NvvzejW6rxK7uH6k-b_2A99nW_s=/1500x/smart/2488f3402bf3418d908d578d1d1c9b41/ccmcms-jdn/2233808.jpg'),
Employee(id: '4', prenom: 'Hazem', numtlphn: '78995159', 
formationaccomplies: 'Une partie dans le profil \n du client dans back office pour que \n dans le choix du client du changement de coach, \n il peut trouver comment s’orienter.',
email: 'hazembakouri@oyem.tn', citationPref: 'La vie est un flambeau toujours prêt à s\'éteindre',
resume : 'Une partie dans le profil du client dans back office pour que dans le choix du client du changement de coach, il peut trouver comment s’orienter.',
 photo: 'https://cdn.futura-sciences.com/buildsv6/images/wide1920/3/6/0/36006517b2_50166642_mz.jpg', nom: 'Bakouri'),
 
 ];

List<Employee> get employees {
  return [..._employees];
}
Employee findById(String id){
  return _employees.firstWhere((employer) => employer.id == id );
}

}