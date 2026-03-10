import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {

  final UserModel user;

  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Профайл"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),

            const SizedBox(height:20),

            Text(
              "Register: ${user.register}",
              style: const TextStyle(fontSize:18),
            ),

            const SizedBox(height:10),

            Text(
              "Password: ${user.password}",
              style: const TextStyle(fontSize:18),
            ),

          ],
        ),
      ),
    );
  }
}