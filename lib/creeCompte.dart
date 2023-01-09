import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_review/main.dart';
import 'package:flutter_review/model_item.dart';
import 'package:localstorage/localstorage.dart';



class CreateCompt extends StatefulWidget {
  const CreateCompt({super.key});

  @override
  State<CreateCompt> createState() => CreateComptState();
}

class CreateComptState extends State<CreateCompt> {

  @override
  Widget build(BuildContext context) {
      final myController = TextEditingController();
      final myController2 = TextEditingController();
      final myController3 = TextEditingController();
      final myController4 = TextEditingController();
      final myController5 = TextEditingController();
      final TodoList list = TodoList();
  final LocalStorage storage = LocalStorage('n');
  // TextEditingController controller = TextEditingController();

  // methode privé  addItem

  // classe enregistrer
  _saveToStorage(){
    storage.setItem('todos', list.recuperer());
  }
  //methode delete
  _clearStorage()async{
    await storage.clear();
    setState(() {
      list.items = storage.getItem('todos') ?? [];

      
    });
  }
        _addItem(String nom,String prenom,String email,String mdp,String confmdp){
    setState(() {
     ModelItem item = ModelItem(nom: nom, prenom: prenom, email: email, mdp: mdp, confmdp: confmdp);
      var istable = storage.getItem('todos');
      
      if(istable !=null){
        list.items.add(item);
        print(list.items.length);
       
         

         storage.setItem('todos', list.recuperer());
      }else{
         _saveToStorage();
      }
     

     // confirmer
     confirmer(){
      var recupereData = storage.getItem('todos') ;
      print(recupereData);
     };
      _saveToStorage();
    });
  }
      void _save() {
    _addItem(myController.value.text,myController2.value.text,myController3.value.text,myController4.value.text,myController5.value.text);
    myController.clear();
   

    

  }
    String? nom;
    String? prenom;
    String? email;
    String? mdp;
    String? confmdp;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page creation de compte",style: TextStyle(fontWeight: FontWeight.w800),),
        elevation: 15,
        backgroundColor:Colors.blue,
      ),
      body: Container(
       
        padding:const  EdgeInsets.all(10),
        child: Center(
               child: Form(
                
              
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  
                  width:200,
                  height:100,
                  child: Image.asset("images/p.png")
                  ,),
                TextFormField(
                  validator:(value)=>value!.isEmpty?"Entrez votre nom":null,
                  onSaved: (value)=>nom =value,
                  controller: myController,
                  decoration:const  InputDecoration(
                    
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: "nom"
                  ),
                ),
                const SizedBox(height: 10,),

                


                //autre colonne
                 TextFormField(
                    controller: myController2,
                     validator:(value)=>value!.isEmpty?"Entrez votre nom":null,
                  onSaved: (value)=>prenom =value,
                  decoration:const  InputDecoration(
                    icon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                    labelText: "prenom"
                  ),
                ),
                  const SizedBox(height: 10,),
                //autre colonne 
                     TextFormField(
                      controller: myController3,
                       validator:(value)=>value!.isEmpty?"Entrez votre nom":null,
                  onSaved: (value)=>email =value,
                     
                    decoration:const  InputDecoration(
                    icon: Icon(Icons.email_rounded),
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    
                  ),
                ),
                //autre colonne 
                 const SizedBox(height: 10,),

                    TextFormField(
                 
                      controller: myController4,
                       validator:(value)=>value!.isEmpty?"Entrez votre nom":null,
                  onSaved: (value)=>mdp=value,
                      obscureText: true,
                     
                    decoration:const  InputDecoration(
                    icon: Icon(Icons.remove_red_eye_rounded),
                    border: OutlineInputBorder(),
                    labelText: "Mot de passe",
                    
                  ),
                ),
                //autre colonne 
                  const SizedBox(height: 10,),
                       TextFormField(
                        controller: myController5,
                         validator:(value)=>value!.isEmpty?"Entrez votre nom":null,
                  onSaved: (value)=>confmdp =value,
                      obscureText: true,
                     
                    decoration:const  InputDecoration(
                    icon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                    labelText: "Confirmez le mot de passe",
                    
                  ),
                ),
             //autre soumission
               const SizedBox(height: 10,),
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor: Colors.blue[400]
                  ),
                      onPressed:(){
                        // _save();
                        print("save: $_addItem()");
                      },
                   child:const  Text("Submit",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25),)
                   ),



              ],
            )
            ),
        ),
      ),
    );
  }
  
  
}
