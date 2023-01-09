import 'package:flutter/material.dart';
import 'package:flutter_review/connexion.dart';
import 'package:flutter_review/creeCompte.dart';
import 'package:flutter_review/model_item.dart';
import 'package:localstorage/localstorage.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
    final myController = TextEditingController();
      final myController2 = TextEditingController();
      final myController3 = TextEditingController();
      final myController4 = TextEditingController();
      final myController5 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        
        centerTitle: true,
        elevation: 10,
        backgroundColor: Color.fromARGB(220, 185, 32, 212),

        
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(height: 200,width: 100,child: Image.asset('images/p.png'),),
               ElevatedButton(
              style:ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(220, 188, 7, 219)),
              onPressed: (){
                // interface de connexion
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(BuildContext context)=> Connexion(),
                  )

                );
              },
              child: const Text("Se connecter",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,),),),
             const   Text("_________Ou________",style: TextStyle(color: Colors.blue,fontSize: 20),),
           const  SizedBox(height: 20,),
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue
              ),
              onPressed:(){
                //interface de creation de compte
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  
                    
                    builder:(BuildContext context)=> const CreateCompt(),
                    )
                );
              },
              child: const Text('Crée un compte',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),) ,)
            ],
          ),
      ),
      
    );

  }
  //
  
}


