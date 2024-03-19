import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoomPage extends StatefulWidget {
  final String roomNumber;

  RoomPage({required this.roomNumber});

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late Future<Map<String, dynamic>> roomData;

  @override
  void initState() {
    super.initState();
    roomData = fetchRoomData(widget.roomNumber);
  }

  Future<Map<String, dynamic>> fetchRoomData(String roomNumber) async {
    String jsonString =
        await rootBundle.loadString('assets/data/room_data.json');
    List<dynamic> dataList = json.decode(jsonString);
    return dataList.firstWhere((room) => room['roomNumber'] == roomNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room ${widget.roomNumber}'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: roomData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return buildRoomInfo(context, snapshot.data!);
          }
        },
      ),
    );
  }

  Widget buildRoomInfo(BuildContext context, Map<String, dynamic> data) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Room: ${data['roomNumber']}'),
          SizedBox(height: 10),
          _buildInfoRow('Name', data['name']),
          _buildInfoRow('Status', data['status']),
          _buildInfoRow('Class', '${data['class']} | Batch: ${data['batch']}'),
          _buildInfoRow('Subject', data['subject']),
          _buildInfoRow('Time', data['time']),
          _buildInfoRow('Computers', data['computers'].toString()),
          _buildInfoRow(
              'Printers', '${data['printers']} (${data['printerStatus']})'),
          SizedBox(height: 10),
          Text(
            'Specifications:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          _buildSpecInfoRow('RAM', data['specifications']['ram']),
          _buildSpecInfoRow('Storage', data['specifications']['storage']),
          _buildSpecInfoRow('OS', data['specifications']['os'].join(', ')),
        ],
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
