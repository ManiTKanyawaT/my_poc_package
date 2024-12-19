library my_poc_package;

import 'package:flutter/material.dart';

class MyPocForm extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const MyPocForm(
      {super.key, required this.labelText, required this.controller});

  @override
  State<MyPocForm> createState() => _MyPocFormState();
}

class _MyPocFormState extends State<MyPocForm> {
  final _formKey = GlobalKey<FormState>();

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Only alphabetic characters are allowed';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
              labelText: widget.labelText,
              border: const OutlineInputBorder(),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            validator: _validateInput,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Text(
                        'Valid input!',
                        style: TextStyle(color: Colors.black),
                      )),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text('Invalid input',
                        style: TextStyle(color: Colors.black)),
                  ),
                );
              }
            },
            child: const Text('Submit', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
