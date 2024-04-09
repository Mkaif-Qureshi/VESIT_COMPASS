import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String time;
  final String venue;
  final String organizedBy;

  const EventCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.organizedBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              "http://127.0.0.1:5001/$imagePath",
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      'Date: $date',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      'Time: $time',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      'Venue: $venue',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Organized by: $organizedBy',
                  style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
