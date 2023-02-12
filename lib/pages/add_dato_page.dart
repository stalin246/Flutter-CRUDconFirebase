import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class addDatoPage extends StatefulWidget{


  const addDatoPage ({super.key});
  
  @override
  State<addDatoPage>createState()=>_addDatoPageState();

}

class _addDatoPageState extends State<addDatoPage>{
// Creamos el conmtrolador para poder guardar la informacion
 TextEditingController datoController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: const Text('Añadir Dato'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[
            TextField(
              controller: datoController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el dato:',
              ),
            ),



            ElevatedButton(onPressed: ()async {

              // print(datoController.text);
              await addDato(datoController.text).then((_){
                Navigator.pop(context);

              });
              
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),),
            child: const Text('Guardar'))
          ],
        ),
      )
    );
  }
}