import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/calls_screen.dart';
import '../screens/clients_screen.dart';
import '../screens/contacts_screen.dart';
import '../screens/meetings_screen.dart';
import '../screens/reports_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const CallsScreen(),
    const ClientsScreen(),
    const ContactsScreen(),
    const MeetingsScreen(),
    const ReportsScreen(),
  ];

  final List<String> _titles = [
    'Dashboard',
    'Calls',
    'Clients',
    'Contacts',
    'Meetings',
    'Reports',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.headset_mic, size: 30, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Call Center Hub',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Agent Portal',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(0, 'Dashboard', Icons.dashboard),
            _buildDrawerItem(1, 'Calls', Icons.phone_in_talk),
            _buildDrawerItem(2, 'Clients', Icons.business),
            _buildDrawerItem(3, 'Contacts', Icons.contacts),
            _buildDrawerItem(4, 'Meetings', Icons.calendar_today),
            _buildDrawerItem(5, 'Reports', Icons.analytics),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }

  Widget _buildDrawerItem(int index, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: _selectedIndex == index ? Theme.of(context).primaryColor : null),
      title: Text(
        title,
        style: TextStyle(
          color: _selectedIndex == index ? Theme.of(context).primaryColor : null,
          fontWeight: _selectedIndex == index ? FontWeight.bold : null,
        ),
      ),
      selected: _selectedIndex == index,
      onTap: () => _onItemTapped(index),
    );
  }
}
