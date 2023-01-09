//model 
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:localstorage/localstorage.dart';


class ModelItem{
  String nom;
  String prenom;
  String email;
  String mdp;
  String confmdp;

  ModelItem({required this.nom,required this.prenom,required this.email,required this.mdp,required this.confmdp});

 ModelItem.fromJson(Map<String,dynamic> obj)
   :    nom =obj['nom'],
        prenom=obj['prenom'],
        email=obj['email'],
        mdp=obj['mdp'],
        confmdp=obj['prenom'];

        Map<String,dynamic> toJson()=>{
          'nom':nom,
          'prenom':prenom,
          'email':email,
          'mdp':mdp,
          'confmdp':confmdp,

          
        };

       
    
  
}

// classe convertir en liste 
class TodoList{
  List<ModelItem> items= [];

  recuperer(){
    return items.map((item){
        return item.toJson();
    }).toList();

    
  }

}

