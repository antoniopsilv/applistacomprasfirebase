import 'package:applistacomprasfirebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/listacompras.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      title: 'DM3 - Lista Compras Firebase',
      home: ListaCompras(),
    ),
  );
}