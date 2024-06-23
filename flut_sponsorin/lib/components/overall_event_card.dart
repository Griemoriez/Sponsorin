import 'package:flutter/material.dart';

class overall_event_card extends StatelessWidget {
  final String event_name;
  final String event_type;
  final String event_location;
  final String event_date;
  final int event_status;
  overall_event_card({Key? key, required this.event_name, required this.event_type, required this.event_location, required this.event_date, required this.event_status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Card(
        color: getColorBasedOnStatus(event_status),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event_name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    event_type,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              SizedBox(height: 4),
              Text(
                'Onsite : $event_location',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 4),
              Text(
                event_date,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    'EVENT DETAILS',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Color getColorBasedOnStatus(int status) {
    if (status == -1) {
      return Colors.white;
    } else if (status == 0) {
      return Colors.red.shade200;
    } else if (status == 1) {
      return Colors.green.shade200;
    } else {
      return Colors.grey; // Default color if status is unknown
    }
  }
}
