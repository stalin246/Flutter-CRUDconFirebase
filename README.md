# CRUD con Flutter utilizando Firebase

### Integrantes: 
- Eduardo Farinango
- Luis Valencia

# Configuración
## Firebase 
Creamos un proyecto en el sitio [oficial](https://firebase.google.com/?hl=es-419) y utilizaremos cloud firestore para crear nuestra coleccion que alojara el campo y valor que creemos en nuestra aplicación
![image](https://user-images.githubusercontent.com/77359338/218292674-a39a0d87-3f21-410f-89db-c9cf2cae4f0d.png)

## Descripción general de FlutterFire

![image](https://user-images.githubusercontent.com/77359338/218292757-d83232b6-6e72-4baa-ba71-daa88490fe04.png)



Antes de que se pueda usar cualquier servicio de Firebase, primero debe instalar el firebase_core complemento, que es responsable de conectar su aplicación a Firebase.

Instale el complemento ejecutando el siguiente comando desde la raíz del proyecto:
```
flutter pub add firebase_core
```
Para configurarlo se debe elegir el tipo de proyecto creado en Firebase y elegir el tipo de servicio, para eso se emplea este comando:
## Inicializando FlutterFire

Antes de que se pueda usar cualquiera de los servicios de Firebase, se debe inicializar FlutterFire, puede obtener más información sobre Firebase CLI en la [documentación](https://firebase.google.com/docs/cli)


Se activa el Fluter Cli en el proyecto con el comando: 

```
dart pub global activate flutterfire_cli
```

Ahora configuramos al proyecto que se va conectar nuestra aplicación en flutter
```
flutterfire configure
```
Realizando este proceso la aplicacion se conecta con Firebase


## Inicialización

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

## Cloud Firestore

En los servicos que nos ofrece se utilizara esto, para emplearlo podemos instalarlo por medio del comando:
```
flutter pub add cloud_firestore
```
o agregando en el archivo pubsec.yaml lo siguiente: 

```
dependencies:
  cloud_firestore: ^4.3.2
```
Ahora se podra importar el servicio de Cloud Firestore en los servicios que crearemos, esto lo importamos de la siguiente manera:
```
import 'package:cloud_firestore/cloud_firestore.dart';
```

## Configurando la aplicación

En el archivo android/app/build.gradle el minSDK version va segun en lo que se indica en el terminal (com0 un tipo de error) y debe estar habilitado los hilos de ejecución ya que se necesita mas disponibilad para el dispositivo que se va utilizar en este caso un Android.


```
 defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.example.crud_firebase"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-build-configuration.
        // minSdkVersion flutter.minSdkVersion
        minSdkVersion 19
        multiDexEnabled true
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
```

## En la aplicación

Podemos notar que en la aplicaion se crea el archivo [firebase_options.dart](https://github.com/stalin246/Flutter-CRUDconFirebase/blob/master/lib/firebase_options.dart) donde contiene nuestros token del proyecto que se creo en firebase y por medio de esto se realiza la conexion.

De aqui parte el proceso del CRUD en donde crearemos una carpeta de [servicios](https://github.com/stalin246/Flutter-CRUDconFirebase/tree/master/lib/services) (eliminar , actualizar y leer) y carpeta de [paginas](https://github.com/stalin246/Flutter-CRUDconFirebase/tree/master/lib/pages) para que estas funciones la utilicen. 

# CRUD 
Para poder realizar el CRUD deberemos crear un directorio en el cual se encontraran las configuraciones de firebases para cada proceso.


- Crear
- Leer
- Actualizar 
- Borrar


![directorio](https://user-images.githubusercontent.com/75056800/218315867-68b9b595-0faf-4010-96a9-6b257fa7a8d8.png)

## Leer
Este proceso se realizará con una función que mediante un Query apuntando a una colección creada en Firebase luego de mapearla nos traerá el id del documento y su valor.

## Crear
Este proceso se realizará con una función asíncrona que creara un registro en la colección.

## Actualizar 
Este proceso se realizará con una función asíncrona que devuelve el valor de un registro mediante una promesa comprueba si tiene el miso id y guarda el valor editado.

## Borrar 
Este proceso se realizará con una función asíncrona que devuelve el valor de un registro mediante una promesa comprueba si tiene el miso id elimina el registro.

![image](https://user-images.githubusercontent.com/75056800/218316664-ffee1427-18be-4f85-84b1-a401f3f755e9.png)
## Página para añadir estudiante


```sh
import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class addStudentPage extends StatefulWidget {
  const addStudentPage({super.key});
  @override
  State<addStudentPage> createState() => _addStudentPageState();
}
class _addStudentPageState extends State<addStudentPage> {
  TextEditingController studentController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
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
            children: [
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
                    enabledMouseCursor: MouseCursor.defer,
                  ),
                  onPressed: () async {
                    // print(studentController.text);
                    await addStudent(studentController.text).then((_) {
                      Navigator.pop(context);
                      const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      );
                    });
                  },
                  child: const Text('Guardar'))
            ],
          ),
        ));
  }
}

```
## Página para editar estudiante


```sh
import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class editStudentPage extends StatefulWidget {
  const editStudentPage({super.key});
  @override
  State<editStudentPage> createState() => _editStudentPageState();
}

class _editStudentPageState extends State<editStudentPage> {
// Creamos el conmtrolador para poder guardar la informacion
  TextEditingController studentController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
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
            children: [
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
                    enabledMouseCursor: MouseCursor.defer,
                  ),
                  onPressed: () async {
                    // print(arguments['uid']);
                    await updateStudent(
                            arguments['uid'], studentController.text)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Actualizar'))
            ],
          ),
        ));
  }
}


```


## Página principal en la que se renderizara la vista y se podrá eliminar un registro


```sh
// Pagina principal
import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Titulo cone stilos
            const Text(
              'Lista de estudiantes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //Para que se vea la lista de estudiantes
            Expanded(
                child: FutureBuilder(
                    future: getStudent(),
                    // La lista que se envia se guarda en snapshot
                    builder: ((context, snapshot) {
                      //Para que no haya error cuando se agrege un dato
                      if (snapshot.hasData) {
                        // return const Text('Hola');
                        return ListView.builder(
                          //Esto almacena la lista en la pantalla
                          itemCount: snapshot.data?.length,
                          itemBuilder: ((context, index) {
                         
                            //Es una forma de borrar elementos(se puede movewrl los nombres en la aplciacion)
                            return Dismissible(
                              onDismissed: (direction) async {
                                await deleteStudent(
                                    snapshot.data?[index]['uid']);
                                snapshot.data?.removeAt(index);
                              },
                              confirmDismiss: (direction) async {
                                bool result = false;
                                // print("confirm dismiss");
                                result = await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                            "¿Vas a eliminar a este usuario ${snapshot.data?[index]['name']}?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                return Navigator.pop(
                                                  context,
                                                  false,
                                                );
                                              },
                                              child: const Text(
                                                "Cancelar",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                return Navigator.pop(
                                                  context,
                                                  true,
                                                );
                                              },
                                              child: const Text("Si")),
                                        ],
                                      );
                                    });

                                return result;
                              },
                              background: Container(
                                color: Colors.red,
                                child: const Icon(Icons.delete),
                              ),

                              //actualizar estado de la lista

                      
                              direction: DismissDirection.endToStart,
                              key: Key(snapshot.data?[index]['uid']),
                              //actualizar estado de la lista

                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  title: Text(snapshot.data?[index]['name']),
                                  trailing: const Icon(Icons.edit),
                                  onTap: () async {
                                    // Recibe argumentos para mandar el nombre a editar
                                    await Navigator.pushNamed(context, '/edit',
                                        arguments: {
                                          "name": snapshot.data?[index]['name'],
                                          "uid": snapshot.data?[index]['uid']
                                        });
                                    setState(() {});
                                  },
                                ),
                              ),
                            );
                          }),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(92, 121, 216, 240),
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


```
Para poder clonar este repositorio utilizaremos el siguiente comando tomando en cuenta que se debe tener instalado [GIT]: <https://git-scm.com/downloads> con anterioridad

```sh
git clone https://github.com/stalin246/Flutter-CRUDconFirebase.git

```

## una vez clonado el repositorio se lo podría abrir con el editor preferido, cuando ya estemos con el proyecto abierto deberemos ejecutar el siguiente comando que instalara lo que el proyecto 

```sh
flutter packages get

```


