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
                  if(snapshot.hasData){
                  // return const Text('Hola');
                    return ListView.builder(
                    //Esto almacena la lista en la pantalla
                    itemCount: snapshot.data?.length,
                    itemBuilder: ((context, index) {
                       //return Text(snapshot.data?[index]['name']);
                      //Es una forma de borrar elementos(se puede movewrl los nombres en la aplciacion)
                      return Dismissible(
                        onDismissed: (direction) async{
                          await deleteStudent(snapshot.data?[index]['uid']);
                          snapshot.data?.removeAt(index);
                        },
                        confirmDismiss: (direction)async{
        
                          bool result = false;
                          // print("confirm dismiss");
                          result = await showDialog(context: context, builder: (context){
                            return AlertDialog(
        
        
                              title: Text("¿Vas a eliminar a este usuario ${snapshot.data?[index]['name']}?"),
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

                             //actualizar estado de la lista



                             
                        // key: UniqueKey(),
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
                        ),
                      );
                    }),
                    );
        
        
                  }else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                
                }))
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(92, 121, 216, 240),
         

   
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {
            
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}