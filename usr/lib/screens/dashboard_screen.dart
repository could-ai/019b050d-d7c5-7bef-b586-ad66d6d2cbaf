import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard Overview',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          // Summary Cards
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildSummaryCard(context, 'Total Calls', '${mockCalls.length}', Icons.phone, Colors.blue),
              _buildSummaryCard(context, 'Active Clients', '${mockClients.where((c) => c.status == "Active").length}', Icons.business, Colors.green),
              _buildSummaryCard(context, 'Contacts', '${mockContacts.length}', Icons.people, Colors.orange),
              _buildSummaryCard(context, 'Meetings Today', '2', Icons.calendar_today, Colors.purple),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Recent Activity',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Card(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final call = mockCalls[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: call.status == 'Missed' ? Colors.red.shade100 : Colors.blue.shade100,
                    child: Icon(
                      call.status == 'Incoming' ? Icons.call_received :
                      call.status == 'Outgoing' ? Icons.call_made : Icons.call_missed,
                      color: call.status == 'Missed' ? Colors.red : Colors.blue,
                    ),
                  ),
                  title: Text(call.callerName),
                  subtitle: Text('${call.status} • ${call.duration}'),
                  trailing: Text(
                    '${call.timestamp.hour}:${call.timestamp.minute.toString().padLeft(2, '0')}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context, String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
