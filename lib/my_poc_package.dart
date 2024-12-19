library my_poc_package;

import 'package:flutter/material.dart';

class CharacterValidationForm extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const CharacterValidationForm(
      {super.key, required this.labelText, required this.controller});

  @override
  State<CharacterValidationForm> createState() =>
      _CharacterValidationFormState();
}

class _CharacterValidationFormState extends State<CharacterValidationForm> {
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
            ),
            validator: _validateInput, 
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Valid input!')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invalid input')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}