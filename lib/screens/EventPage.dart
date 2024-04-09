import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vesit_compass/widgets/MyAppBar.dart';

import '../constants.dart';
import '../widgets/EventCard.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<dynamic> events = [];

  bool isLoading = true; // Track loading state
  bool isError = false; // Track error state

  @override
  void initState() {
    super.initState();
    fetchEvents().then((data) {
      setState(() {
        events = data;
        isLoading = false; // Set loading state to false when data is loaded
      });
    }).catchError((error) {
      print('Error fetching events: $error');
      setState(() {
        isError = true; // Set error state to true
        isLoading = false; // Set loading state to false
      });
    });
  }

  Future<List<dynamic>> fetchEvents() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5001/events'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: const MyAppBar(
        title1: 'Events At VESIT',
        text1Size: 16,
        logoPath: 'assets/images/vesit.png',
      ),
      body: isLoading
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator while fetching data
          : isError
              ? const Center(
                  child: Text(
                      'Error loading events. Please try again.'), // Show error message
                )
              : events.isEmpty
                  ? const Center(
                      child: Text(
                          'No events available'), // Show message when no events available
                    )
                  : ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (BuildContext context, int index) {
                        final event = events[index];
                        return EventCard(
                          title: event['title'],
                          date: event['date'],
                          time: event['time'],
                          venue: event['venue'],
                          organizedBy: event['society'],
                          imagePath: event['image_path'],
                        );
                      },
                    ),
    );
  }
}
