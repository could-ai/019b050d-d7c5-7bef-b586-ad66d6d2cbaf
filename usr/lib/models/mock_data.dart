import 'package:flutter/material.dart';

// Models
class Call {
  final String id;
  final String callerName;
  final String phoneNumber;
  final DateTime timestamp;
  final String status; // Incoming, Outgoing, Missed
  final String duration;

  Call({
    required this.id,
    required this.callerName,
    required this.phoneNumber,
    required this.timestamp,
    required this.status,
    required this.duration,
  });
}

class Client {
  final String id;
  final String companyName;
  final String industry;
  final String email;
  final String status; // Active, Inactive

  Client({
    required this.id,
    required this.companyName,
    required this.industry,
    required this.email,
    required this.status,
  });
}

class Contact {
  final String id;
  final String fullName;
  final String role;
  final String email;
  final String phone;

  Contact({
    required this.id,
    required this.fullName,
    required this.role,
    required this.email,
    required this.phone,
  });
}

class Meeting {
  final String id;
  final String title;
  final DateTime dateTime;
  final String participants;
  final String location;

  Meeting({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.participants,
    required this.location,
  });
}

// Mock Data
final List<Call> mockCalls = [
  Call(id: '1', callerName: 'John Doe', phoneNumber: '+1 555-0101', timestamp: DateTime.now().subtract(const Duration(minutes: 10)), status: 'Incoming', duration: '5:23'),
  Call(id: '2', callerName: 'Acme Corp', phoneNumber: '+1 555-0102', timestamp: DateTime.now().subtract(const Duration(hours: 1)), status: 'Outgoing', duration: '2:10'),
  Call(id: '3', callerName: 'Jane Smith', phoneNumber: '+1 555-0103', timestamp: DateTime.now().subtract(const Duration(hours: 3)), status: 'Missed', duration: '0:00'),
  Call(id: '4', callerName: 'Tech Support', phoneNumber: '+1 555-0104', timestamp: DateTime.now().subtract(const Duration(days: 1)), status: 'Incoming', duration: '12:45'),
];

final List<Client> mockClients = [
  Client(id: '1', companyName: 'Global Tech Solutions', industry: 'Technology', email: 'contact@globaltech.com', status: 'Active'),
  Client(id: '2', companyName: 'HealthPlus Inc.', industry: 'Healthcare', email: 'info@healthplus.com', status: 'Active'),
  Client(id: '3', companyName: 'EcoFriendly Goods', industry: 'Retail', email: 'support@ecogoods.com', status: 'Inactive'),
];

final List<Contact> mockContacts = [
  Contact(id: '1', fullName: 'Alice Johnson', role: 'Manager', email: 'alice@example.com', phone: '+1 555-1111'),
  Contact(id: '2', fullName: 'Bob Williams', role: 'Developer', email: 'bob@example.com', phone: '+1 555-2222'),
  Contact(id: '3', fullName: 'Charlie Brown', role: 'Sales', email: 'charlie@example.com', phone: '+1 555-3333'),
];

final List<Meeting> mockMeetings = [
  Meeting(id: '1', title: 'Quarterly Review', dateTime: DateTime.now().add(const Duration(hours: 2)), participants: 'Alice, Bob', location: 'Conference Room A'),
  Meeting(id: '2', title: 'Client Onboarding', dateTime: DateTime.now().add(const Duration(days: 1)), participants: 'Global Tech Team', location: 'Online'),
  Meeting(id: '3', title: 'Weekly Standup', dateTime: DateTime.now().add(const Duration(days: 2)), participants: 'Dev Team', location: 'Room 303'),
];
