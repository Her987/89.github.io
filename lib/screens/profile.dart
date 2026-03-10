import 'dart:io';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Профайл")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (user.imagePath.isNotEmpty)
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File(user.imagePath)),
              ),

            Text("${user.lastName} ${user.firstName}"),
            Text(user.register),
            Text(user.address),
            Text(user.gender),
          ],
        ),
      ),
    );
  }
}
