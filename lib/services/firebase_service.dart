// Aqui se crearan las funciones leer, crear,borrar  actualizar
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Funcion para leer la informacion


// Promesa: va a venir una lista


Future<List>getStudent()async{

  List student=[];

  QuerySnapshot querySnapshot = await db.collection('student').get();
  for (var doc in querySnapshot.docs){

    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person ={
      'name': data['name'],
      //-----------------------
      

      //--------------------
      'uid': doc.id,
    };
    student.add(person);
  }
  return student;

  // Hago referencia a la coleccion

  // CollectionReference collectionReferenceStudent = db.collection('student');

  // QuerySnapshot queryStudent = await collectionReferenceStudent.get();

  // queryStudent.docs.forEach((documento) { 
  //   student.add(documento.data());

  // });
  // Future.delayed(const Duration(seconds: 3));
  // return student;
}

// Funcion para guardar en base de datos

Future<void>addStudent(String name)async {

  await db.collection('student').add({"name": name});

}

//Funcion actualizar
Future<void>updateStudent(String uid, String newName) async{

  await db.collection('student').doc(uid).set({'name': newName});

}

//Funcion para eliminar en firebase
Future<void>deleteStudent(String uid) async{

  await db.collection('student').doc(uid).delete();
  
}