import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class addStudentPage extends StatefulWidget{


  const addStudentPage ({super.key});
  
  @override
  State<addStudentPage>createState()=>_addStudentPageState();

}

class _addStudentPageState extends State<addStudentPage>{
// Creamos el conmtrolador para poder guardar la informacion
 TextEditingController studentController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
 
                        backgroundColor: Color.fromARGB(255, 177, 212, 221),

               
               
                shadowColor: Colors.grey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
         

        title: const Text('Crud Firebase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:[
            const Text(
              'Agregar estudiante',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            TextField(
              controller: studentController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre:',
              ),
            ),
            const SizedBox(
              height: 20,
            ),


            ElevatedButton(
              style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 177, 212, 221),

               
               
                shadowColor: Colors.grey,
                elevation: 5,
                enabledMouseCursor:  MouseCursor.defer,
              ),


              
              
              onPressed: ()async {

              // print(studentController.text);
              await addStudent(studentController.text).then((_){
                Navigator.pop(context);
                 const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                );  

              });
              
            },child: const Text(
              'Guardar'
              

            
            ))


          ],
          
           





        ),


      )

    );
  }
}