import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_model.dart';
import '../services/storage_service.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final first = TextEditingController();
  final last = TextEditingController();
  final reg = TextEditingController();
  final address = TextEditingController();

  String gender = "Эрэгтэй";
  XFile? pickedImage;

  final ImagePicker _picker = ImagePicker();

  // Зураг сонгох функц
  Future<void> pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if (image != null) {
        setState(() {
          pickedImage = image;
        });
      }
    } catch (e) {
      print('Зураг сонгоход алдаа гарлаа: $e');
    }
  }

  // Хэрэглэгчийн мэдээллийг хадгалах
  void save() async {
    final user = UserModel(
      firstName: first.text,
      lastName: last.text,
      register: reg.text,
      address: address.text,
      gender: gender,
      imagePath: pickedImage?.path ?? "",
    );

    await StorageService.saveUser(user);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Бүртгэл")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: first, decoration: const InputDecoration(labelText: "Нэр")),
            TextField(controller: last, decoration: const InputDecoration(labelText: "Овог")),
            TextField(controller: reg, decoration: const InputDecoration(labelText: "Регистр")),
            TextField(controller: address, decoration: const InputDecoration(labelText: "Хаяг")),

            DropdownButton<String>(
              value: gender,
              items: const [
                DropdownMenuItem(value: "Эрэгтэй", child: Text("Эрэгтэй")),
                DropdownMenuItem(value: "Эмэгтэй", child: Text("Эмэгтэй")),
              ],
              onChanged: (v) => setState(() => gender = v!),
            ),

            const SizedBox(height: 10),

            ElevatedButton(onPressed: pickImage, child: const Text("Зураг сонгох")),

            if (pickedImage != null)
              kIsWeb
                  ? Image.network(pickedImage!.path, height: 100) // Web дээр
                  : Image.file(File(pickedImage!.path), height: 100), // Mobile/Desktop

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: save,
              child: const Text("Нэвтрэх"),
            ),
          ],
        ),
      ),
    );
  }
}
