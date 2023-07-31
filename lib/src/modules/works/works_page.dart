import 'package:flutter/material.dart';

class WorksPage extends StatelessWidget {
  const WorksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Center(child: Icon(Icons.directions_bike));
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.directions_bike),
          SizedBox(height: 20),
          Text('WORK IN PROGRESS!')
        ],
      ),
    );
  }
}
