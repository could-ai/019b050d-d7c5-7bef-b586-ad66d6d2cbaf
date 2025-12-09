import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: mockContacts.length,
        itemBuilder: (context, index) {
          final contact = mockContacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: Text(contact.fullName.substring(0, 1)),
            ),
            title: Text(contact.fullName),
            subtitle: Text('${contact.role} • ${contact.phone}'),
            trailing: IconButton(
              icon: const Icon(Icons.message, color: Colors.blue),
              onPressed: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
