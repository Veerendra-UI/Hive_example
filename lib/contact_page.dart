import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/new_contact_form.dart';

import 'models/contact.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Example'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildListView()),
          NewContactForm(),
        ],
      ),
    );
  }

  ListView _buildListView() {
    final contactBox = Hive.box('contacts');

    return ListView.builder(
      itemCount: contactBox.length,
      itemBuilder: (context, index) {
        final contact = contactBox.get(index) as Contact;

        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.age.toString()),
        );
      },
    );
  }
}
