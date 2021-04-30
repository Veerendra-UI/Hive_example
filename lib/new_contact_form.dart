import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/models/contact.dart';

class NewContactForm extends StatefulWidget {
  @override
  _NewContactFormState createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _age;

  void addContact(Contact contact) {
    Hive.box('contacts').add(contact);
    // contactBox.add(contact);
    // contactBox.put(123, contact);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  onSaved: (value) => _age = value,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
