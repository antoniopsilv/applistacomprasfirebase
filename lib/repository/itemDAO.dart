import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:io';
import '../model/item.dart';

class ItemDatabase {

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Grava um novo contato no Firestore:
  void insertItem(Item item) {
    _firestore.collection('item').add(
        {
          'item': item.item,
          'marca': item.marca,
          'qtde': item.qtde,
        }
    );
  }

}