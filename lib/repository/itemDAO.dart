import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io';
import '../model/item.dart';

class ItemDatabase {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Grava um novo item no Firestore:
  void insertItem(Item item) {
    _firestore.collection('item').add(
        {
          'item': item.item,
          'marca': item.marca,
          'qtde': item.qtde,
        }
    );
  }

  // Apaga um item com um certo id:
  void deleteItem(String id) {
    _firestore.collection('item').doc(id).delete();
  }

}