import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Log'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: mockCalls.length,
        itemBuilder: (context, index) {
          final call = mockCalls[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: _getStatusColor(call.status).withOpacity(0.2),
              child: Icon(
                _getStatusIcon(call.status),
                color: _getStatusColor(call.status),
              ),
            ),
            title: Text(call.callerName),
            subtitle: Text(call.phoneNumber),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${call.timestamp.hour}:${call.timestamp.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(call.duration, style: const TextStyle(fontSize: 12)),
              ],
            ),
            onTap: () {
              // Show call details
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.dialpad),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Missed': return Colors.red;
      case 'Incoming': return Colors.green;
      case 'Outgoing': return Colors.blue;
      default: return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Missed': return Icons.call_missed;
      case 'Incoming': return Icons.call_received;
      case 'Outgoing': return Icons.call_made;
      default: return Icons.phone;
    }
  }
}
