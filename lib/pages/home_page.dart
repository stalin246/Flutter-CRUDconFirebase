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
        title: const Text('Datos registrados'),
        backgroundColor: Colors.yellow
      ),
      body: FutureBuilder(
        
        future: getDato(), 
        // La lista que se envia se guarda en snapshot
        builder: ((context, snapshot) {
          //Para que no haya error cuando se agrege un dato 
          if(snapshot.hasData){
          // return const Text('Hola');
            return ListView.builder(
            //Esto almacena la lista en la pantalla
            itemCount: snapshot.data?.length,
            itemBuilder: ((context, index) {
              // return Text(snapshot.data?[index]['name']);
              //Es una forma de borrar elementos(se puede movewrl los nombres en la aplciacion)
              return Dismissible(
                onDismissed: (direction) async{
                  await deleteDato(snapshot.data?[index]['uid']);
                  snapshot.data?.removeAt(index);
                },
                confirmDismiss: (direction)async{

                  bool result = false;
                  // print("confirm dismiss");
                  result = await showDialog(context: context, builder: (context){
                    return AlertDialog(

                      title: Text("¿Vas a eliminar a este dato ${snapshot.data?[index]['name']}?"),
                      actions:[
                        TextButton(
                          onPressed: (){
                          return Navigator.pop(
                            context,
                            false,
                            );
                        },
                        child: const Text("Cancelar",


                        style: TextStyle(color:Colors.red),
                        )),
                         TextButton(
                          onPressed: (){
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
                // key: UniqueKey(),
                direction: DismissDirection.endToStart,
                key: Key(snapshot.data?[index]['uid']),
                child: ListTile(
              
              
                  title: Text(snapshot.data?[index]['name']),
                  onTap: ()async {
                    // Recibe argumentos para mandar el nombre a editar
                    await Navigator.pushNamed(context, '/edit', arguments: {
                      "name": snapshot.data?[index]['name'],
                      "uid": snapshot.data?[index]['uid']
                    });
                    setState(() {
                      
                    });
                  },
                ),
              );
            }),
            );


          }else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        
        })),
      
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {
            
          });
        },

        
        child: const Icon(Icons.add),
        backgroundColor: Colors.yellow,


        
        ),
    );
  }
}

