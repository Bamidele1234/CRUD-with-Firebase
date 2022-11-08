import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exercise6/bloc/app_bloc.dart';
import 'package:exercise6/constants.dart';
import 'package:exercise6/model/task.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTaskSheet extends StatefulWidget {
  const EditTaskSheet({
    required this.function,
    Key? key,
  }) : super(key: key);

  final String function;

  @override
  State<EditTaskSheet> createState() => _EditTaskSheetState();
}

class _EditTaskSheetState extends State<EditTaskSheet> {
  final editTaskController = TextEditingController();
  final _fireStore = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  void dispose() {
    editTaskController.dispose();
    super.dispose();
  }

  getCurrentUser() {
    try {
      final user = _user.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final add = widget.function == '/add' ? true : false;

    return Consumer<AppBloc>(
      builder: (BuildContext context, data, Widget? child) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SizedBox(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Form(
                          key: data.formKey,
                          child: TextFormField(
                            validator: (value) {
                              // Ensure the text field passes some criteria
                              if (value == null || value.isEmpty) {
                                return 'Please enter a task';
                              } else if (value.startsWith(' ')) {
                                return 'Cannot start with a space';
                              } else {
                                return null;
                              }
                            },
                            controller: editTaskController,
                            textInputAction: TextInputAction.newline,
                            maxLength: 50,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                            ),
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: add ? 'Create task' : 'Change task',
                              hintStyle: const TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                              ),
                              labelText: add ? 'Add' : 'Edit',
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.5,
                                color: kShadowColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: IconButton(
                          tooltip: 'Save',
                          iconSize: 30,
                          icon: Icon(
                            Icons.save_rounded,
                            color: Colors.white.withOpacity(0.85),
                          ),
                          onPressed: () {
                            if (data.formKey.currentState!.validate()) {
                              addTask(task: editTaskController.value.text);
                              context.router.pop();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future addTask({required String task}) async {
    final docUser = _fireStore.collection('users').doc();
    // Create the object
    final user = Todo(
      task: task,
      sender: loggedInUser.email,
    );

    // Update the object
    user.tag = docUser.id;
    await docUser.set(user.toJson());
  }
}
