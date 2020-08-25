import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  Firestore.instance.collection("col").document("doc").setData(
      {
        "texto":"rayller"
      }
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: Container(),
    );
  }
}
