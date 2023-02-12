import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class editStudentPage extends StatefulWidget{


  const editStudentPage ({super.key});
  
  @override
  State<editStudentPage>createState()=>_editStudentPageState();

}

class _editStudentPageState extends State<editStudentPage>{
// Creamos el conmtrolador para poder guardar la informacion
 TextEditingController studentController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context){
    // Para recibir los argumentos usamos map ya que es un diccionario o json
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    studentController.text = arguments['name'];
    return Scaffold(

      appBar: AppBar(

 
                        backgroundColor: Color.fromARGB(255, 177, 212, 221),

               
               
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
         

        title: const Text('Edición'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(


          children:[
            const Text(
              'Editar estudiante',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),

            ),
            TextField(

              controller: studentController,

              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo Nombre:',
              ),
               
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 177, 212, 221),

               
               
                shadowColor: Colors.grey,
                elevation: 5,
                enabledMouseCursor:  MouseCursor.defer,
              ),

              
              onPressed: ()async {
                // print(arguments['uid']);
                await updateStudent(arguments['uid'], studentController.text).then((_){
                  Navigator.pop(context);
                  
                  

                }

                
                
                );
             
              
            },child: const Text('Actualizar'))

     


          ],
        ),
      )
    );
  }
}