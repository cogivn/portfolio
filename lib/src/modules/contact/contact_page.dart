import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Center(child: Icon(Icons.directions_boat));
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.directions_boat),
          SizedBox(height: 20),
          Text('WORK IN PROGRESS!')
        ],
      ),
    );
  }
}
