import 'package:cloud_firestore/cloud_firestore.dart';

class DBHandler {
  static CollectionReference products() {
    return FirebaseFirestore.instance.collection('Products');
  }
}
