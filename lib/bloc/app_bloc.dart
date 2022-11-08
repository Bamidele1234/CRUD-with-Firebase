import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';

class AppBloc extends ChangeNotifier {
  // The Global key for the forms
  final formKey = GlobalKey<FormState>();

  // Instantiate Firebase Firestore and Firebase Authentication
  final _fireStore = FirebaseFirestore.instance;

  final _user = FirebaseAuth.instance;

  Future addTask({required String task}) async {
    final docUser = _fireStore.collection('users').doc();
    // Create the object
    final user = Todo(
      id: docUser.hashCode,
      tag: docUser.id,
      task: task,
      sender: _user.currentUser?.email,
    );

    // Update the object
    await docUser.set(user.toJson());
  }

  Stream<List<Todo>> readTasks() => _fireStore
      .collection('users')
      .where('sender', isEqualTo: _user.currentUser?.email)
      .snapshots()
      .map((event) => event.docs.map((e) => Todo.fromJson(e.data())).toList());
}
