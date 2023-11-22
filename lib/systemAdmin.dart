import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home:SystemAdmin(),
  ));
}

class SystemAdmin extends StatefulWidget {
  const SystemAdmin({super.key});

  @override
  State<SystemAdmin> createState() => _SystemAdminState();
}

class _SystemAdminState extends State<SystemAdmin> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(), // Use Spacer to take up remaining space
            Text(
              "SYSTEM ADMIN",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Spacer(), // Use Spacer to take up remaining space
            Text(
              "Hi, Mahmor",
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(width: 8.0), // Add some space between the text and icon
            Icon(Icons.person), // User icon
          ],
        ),
        backgroundColor: Colors.lightGreen.shade700,
      ),
    );
  }
}