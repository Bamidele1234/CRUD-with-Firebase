import 'package:auto_route/auto_route.dart';
import 'package:exercise6/constants.dart';
import 'package:flutter/material.dart';

class EditTaskSheet extends StatelessWidget {
  const EditTaskSheet({
    required this.function,
    Key? key,
  }) : super(key: key);

  final String function;

  @override
  Widget build(BuildContext context) {
    final editTaskController = TextEditingController();

    final add = function == '/add' ? true : false;

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
                        context.router.pop();
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
  }
}
