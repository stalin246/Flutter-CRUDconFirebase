import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class editDatoPage extends StatefulWidget{


  const editDatoPage ({super.key});
  
  @override
  State<editDatoPage>createState()=>_editDatoPageState();

}

class _editDatoPageState extends State<editDatoPage>{
// Creamos el controlador para poder guardar la informacion
 TextEditingController datoController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context){
    // Para recibir los argumentos usamos map ya que es un diccionario o json
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    datoController.text = arguments['name'];
    return Scaffold(

      appBar: AppBar(
        title: const Text('Editar'),
         backgroundColor: Colors.yellow
      ),
      body: Padding(
        
        padding: const EdgeInsets.all(20.0),
        child: Column(
        
          children:[
            TextField(
              controller: datoController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo dato:',
              ),
            ),
            ElevatedButton(
              onPressed: ()async {
                // print(arguments['uid']);
                await updateDato(arguments['uid'], datoController.text).then((_){
                  Navigator.pop(context);
                });
             
              
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow),),
            child: const Text('Actualizar'))
          ],
        ),
      )
    );
  }
}