import 'package:crud_firebase/pages/add_dato_page.dart';
import 'package:crud_firebase/pages/edit_dato_page.dart';
import 'package:flutter/material.dart';
// --------Importamos las librerias de firebase que vamos a utilizar
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/home_page.dart';


// Debe ser asyncrona por que realiza la conexion a firebase y despues inicia la aplicacion 
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
    
    // Define el Brightness y Colores por defecto
    // theme: ThemeData(
    // brightness: Brightness.dark,
    // primaryColor: Colors.lightBlue[800],
    // accentColor: Colors.cyan[600],
    // // Define la Familia de fuente por defecto
    // fontFamily: 'Montserrat',

    // ),
    
    initialRoute: '/',
    routes: {
      '/':(context) => const Home(),
      '/add':(context) => const addDatoPage(),
      '/edit':(context) => const editDatoPage(),
    },
    
   );
   

  }
}

