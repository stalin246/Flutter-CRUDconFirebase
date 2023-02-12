

import 'package:crud_firebase/pages/add_student_page.dart';
import 'package:crud_firebase/pages/edit_student_page.dart';
import 'package:flutter/material.dart';
// --------Importamos las librerias de firebase que vamos a utilizar
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';
import 'screens/splashscreen.dart';


// Debe ser asyncrona por que realiza la conexion a firebase y despues inicia la aplciaion 
// Dentro de la mainfunción, asegúrese de que WidgetsFlutterBindingesté inicializado y luego inicialice Firebase
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    title: 'MaterialApp',
    initialRoute: '/',
    routes: {
      '/' : (context) => SplashScreen(),
      '/home':(context) => const Home(),
      '/add':(context) => const addStudentPage(),
      '/edit':(context) => const editStudentPage(),
    },

   );
  }
}

// class Home extends StatefulWidget {
//   const Home({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Material App Bar'),
//       ),
//       body: FutureBuilder(
        
//         future: getStudent(), 
//         // La lista que se envia se guarda en snapshot
//         builder: ((context, snapshot) {
//           //Para que no haya error cuando se agrege un dato 
//           if(snapshot.hasData){
//           // return const Text('Hola');
//             return ListView.builder(itemCount: snapshot.data?.length,
//             itemBuilder: ((context, index) {
//               return Text(snapshot.data?[index]['name']);
//             }),
//             );


//           }else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
        
//         }))
//     );
//   }
// }

