import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
// Atributos:
  late String? id;
  late String item;
  late String marca;
  late String qtde;

  Item(this.item, this.qtde, this.marca);

  // Constructor com Id
  Item.withId(this.id, this.item, this.qtde, this.marca);

  Item.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc.id as String?;
    item = doc['item'] as String;
    marca = doc['marca'] as String;
    qtde = doc['qtde'] as String;
  }
}