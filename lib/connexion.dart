// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_review/creeCompte.dart';


class Connexion extends StatelessWidget {
final keyForm = GlobalKey<FormState>();
TextEditingController controllerNom = TextEditingController();
TextEditingController controllermdp = TextEditingController();
Connexion({super.key});


  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    CreateComptState email = CreateComptState();
    CreateComptState mdp =CreateComptState();

   CreateComptState myController4 = CreateComptState();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page connexion ",style: TextStyle(fontWeight: FontWeight.w800),),
        centerTitle: true,
        elevation: 15,
        backgroundColor: const Color.fromARGB(220, 188, 7, 219),
      ),
      body:  Container(
       
        padding:const  EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: keyForm,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:200,
                  height:100,
                  child: Image.asset("images/p.png")
                  ,),
                
                const SizedBox(height: 10,),


                //autre colonne
              
                  const SizedBox(height: 10,),
                //autre colonne 
                     TextFormField(
                      controller: controllerNom,
                      validator: (value) => value != null && !value.contains('@')?'Entrez un email valide':null,
                      onSaved: (value)=>email=value as CreateComptState,
                     
                    decoration:  const InputDecoration(
                    icon: Icon(Icons.email_rounded),
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    
                  ),
                ),
                //autre colonne 
                 const SizedBox(height: 10,),

                    TextFormField(
                      controller: controllermdp,
                      obscureText: true,
                      validator: (value) => value !=null && value ==  mdp? 'mot de passe valide':'mot de passe invalide',
                     onSaved: (value)=>value=mdp as String?,
                    decoration:const  InputDecoration( 
                    icon: Icon(Icons.remove_red_eye_rounded),
                    border: OutlineInputBorder(),
                    labelText: "Mot de passe",
                    
                  ),
                ),
                //autre colonne 
             
             //autre soumission
               const SizedBox(height: 10,),
                ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    backgroundColor:const  Color.fromARGB(220, 188, 7, 219)
                  ),
                  onPressed: (){
                    // final cleValide = keyForm.currentState;
                    // if(cleValide!.validate()){
                    //   print("ok");

                    // }else{
                    //   print("non");
                    showDialog(
                      context: context, 
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Row(
                            children: [
                              Text(controllerNom.text),
                              Text(controllermdp.text),
                            ],
                          ),
                        );
                      }
                      );
                    // }
                  },
                   child:const  Text("Submit",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25),)
                   ),
                  //
                   const SizedBox(height: 20,),
                 const   Text("Mot de passe oublié?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200,color: Colors.redAccent),)



              ],
            )
            ),
        ),
      ),
    );
  }
}