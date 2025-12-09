import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports & Analytics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChartPlaceholder(context, 'Call Volume (Weekly)', Colors.blue),
            const SizedBox(height: 20),
            _buildChartPlaceholder(context, 'Client Acquisition', Colors.green),
            const SizedBox(height: 20),
            _buildChartPlaceholder(context, 'Meeting Efficiency', Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildChartPlaceholder(BuildContext context, String title, Color color) {
    return Card(
      elevation: 3,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Expanded(
              child: Center(
                child: Icon(Icons.bar_chart, size: 100, color: color.withOpacity(0.5)),
              ),
            ),
            const Center(child: Text('Chart Visualization Placeholder')),
          ],
        ),
      ),
    );
  }
}
