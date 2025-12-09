import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: mockClients.length,
        itemBuilder: (context, index) {
          final client = mockClients[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: Text(client.companyName.substring(0, 1)),
              ),
              title: Text(client.companyName),
              subtitle: Text('${client.industry} • ${client.email}'),
              trailing: Chip(
                label: Text(
                  client.status,
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                ),
                backgroundColor: client.status == 'Active' ? Colors.green : Colors.grey,
                padding: EdgeInsets.zero,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_business),
      ),
    );
  }
}
