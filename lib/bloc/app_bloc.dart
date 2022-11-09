import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/task.dart';
import '../screens/auth_page/auth_screen.dart';
import '../screens/intro_page/home_screen.dart';

class AppBloc extends ChangeNotifier {
  // The Global key for the forms
  final formKey = GlobalKey<FormState>();

  // Instantiate Firebase Firestore and Firebase Authentication
  final _fireStore = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance;

  bool? showArrow;

  Todo? selectedItem;

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

  Future editTask({required String data}) async {
    final docUser = _fireStore.collection('users').doc(selectedItem!.tag);
    selectedItem!.task = data;
    await docUser.update(selectedItem!.toJson());
  }

  Future updateTask({required Todo item}) async {
    final docUser = _fireStore.collection('users').doc(item.tag);
    await docUser.update(item.toJson());
  }

  Future deleteTask({required Todo item}) async {
    final docUser = _fireStore.collection('users').doc(item.tag);
    await docUser.delete();
  }

  Future checkFirstSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    showArrow = !seen;
    if (!seen) {
      await prefs.setBool('seen', true);
    }

    return Timer(
      const Duration(milliseconds: 2000),
      () {
        if (seen) {
          context.router.replaceNamed(AuthScreen.tag);
        } else {
          context.router.replaceNamed(HomeScreen.tag);
        }
      },
    );
  }

  Stream<List<Todo>> readTasks() => _fireStore
      .collection('users')
      .where('sender', isEqualTo: _user.currentUser?.email)
      .snapshots()
      .map((event) => event.docs.map((e) => Todo.fromJson(e.data())).toList());
}
