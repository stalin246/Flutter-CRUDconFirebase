# CRUD con Flutter utilizando Firebase

### Integrantes: 
- Eduardo Farinango
- Luis Valencia

# Firebase 
Creamos un proyecto en el sitio [oficial](https://firebase.google.com/?hl=es-419) y utilizaremos cloud firestore para crear nuestra coleccion que alojara el csmpo y valor que creemos en nuestra aplicaión
![image](https://user-images.githubusercontent.com/77359338/218292674-a39a0d87-3f21-410f-89db-c9cf2cae4f0d.png)

# Descripción general de FlutterFire

![image](https://user-images.githubusercontent.com/77359338/218292757-d83232b6-6e72-4baa-ba71-daa88490fe04.png)



Antes de que se pueda usar cualquier servicio de Firebase, primero debe instalar el firebase_core complemento, que es responsable de conectar su aplicación a Firebase.

Instale el complemento ejecutando el siguiente comando desde la raíz del proyecto:
```
flutter pub add firebase_core
```
Para configurarlo se debe elegir el tipo de proyecto creado en Firebase y elegir el tipo de servicio, para eso se emplea este comando:
# Inicializando FlutterFire

Antes de que se pueda usar cualquiera de los servicios de Firebase, se debe inicializar FlutterFire, puede obtener más información sobre Firebase CLI en la [documentación](https://firebase.google.com/docs/cli)


Se activa el Fluter Cli en el proyecto con el comando: 

```
dart pub global activate flutterfire_cli
```
En nuestro proyecto añadimos la siguiente importación 

import 'package:cloud_firestore/cloud_firestore.dart';
Esto aplicamos en los sevcios que vamos a utlizar



```
flutterfire configure
```
Realizando este proceso la aplicacion se coencta con Firebase


# Inicialización

Importamos la libreria en la siguiente ruta: 
```
lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
```
Dentro de la main función, asegúrese de que WidgetsFlutterBindingesté inicializado y luego inicialice Firebase
```
lib/main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


```
Una vez inicializado sepuede utilizar FlutterFire

# Cloud Firestore

En los servicos dque nos ofrece se utilizara esto, para emplearlo podemos instalarlo por medio del comando:
```
flutter pub add cloud_ firestore
```
o  agregando en el archivo pubsec.yaml lo siguiente: 

```
dependencies:
  cloud_firestore: ^4.3.2
```
Ahora se podra importar el servicio de Cloud Firestore en los servicios que crearemos, esto lo importamos de la siguiente manera:
```
import 'package:cloud_firestore/cloud_firestore.dart';
```

# Configurando la aplicación

En el archivo android/app/build.gradle el minSDK version va segun el lo que se indica en el terminal por ejemplo:


```

```
