
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/item.dart';
import '../repository/itemDAO.dart';
import 'addItem.dart';
import 'deleteItem.dart';

// StatefulWidget ListaCompras
class ListaCompras extends StatefulWidget {
  @override
  State createState() => ListaComprasState();
}
// State de ListaCompras
class ListaComprasState extends State<ListaCompras> {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
  return
    Scaffold(
       appBar:
          AppBar(
              title: Text('Lista de Compras'),
              backgroundColor: Colors.blue,
          ),

          body: StreamBuilder<QuerySnapshot> (
            stream: _firestore.collection('item').snapshots(),
            builder: (context, snapshot) {
            // Enquanto não tem dados, mostra um indicador de espera...
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            var items = snapshot.data!.docs.map((doc) =>
              Item.fromDocumentSnapshot(doc)
            ).toList();

            return ListView.builder(

              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Item: "+item.item+"\n", style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: "Marca: "+item.marca+"\n"),
                        TextSpan(text: "Qtde: "+item.qtde),
                      ],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  onTap: () {
                    debugPrint("Tapped on " + item.item);
                    debugPrint("Item Id enviado " +item.id!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return
                            DeleteItem(
                                        item.id!,
                                        item.item,
                                        item.marca,
                                        item.qtde
                            );
                        },
                      ),
                    );
                  },
                );
              },
            );
            },
          ),
          ///body: showItems(),
          floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return
                          AddItem();
                      },
                    ),
                  );
                },
                tooltip: "Add new Todo",
                child: new Icon(Icons.add),
              ),
    );
  }
}

