import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  late FirebaseFirestore firestore;
   initiliase() {
    firestore = FirebaseFirestore.instance;
  }



   Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
      await firestore.collection('pacientes').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "nombre": doc['nombre'], "direccion": doc["direccion"]};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return docs;

  }
}