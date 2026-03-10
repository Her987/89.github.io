import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/user_model.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> services = [
    {"icon": Icons.help_outline, "title": "Санал асуулга"},
    {"icon": Icons.account_balance, "title": "“Чингис Хаан” Үндэсний Баялгийн Сан"},
    {"icon": Icons.security, "title": "Нийгмийн даатгалын мэдээлэл"},
    {"icon": Icons.account_balance_wallet, "title": "Зээлийн мэдээлэл"},
    {"icon": Icons.medical_services, "title": "Эрүүл мэндийн даатгал төлөлтийн мэдээлэл"},
    {"icon": Icons.badge, "title": "Иргэний бүртгэлийн мэдээлэл"},
    {"icon": Icons.location_on, "title": "Хаягийн өөрчлөлтийн мэдээлэл"},
    {"icon": Icons.favorite, "title": "Гэрлэлтийн мэдээлэл"},
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProfileScreen(user: widget.user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset("assets/logo.png", height: 30), // logo
            const SizedBox(width: 8),
            const Text("",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
          ],
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.blue, size: 28),
          SizedBox(width: 16),
          Icon(Icons.menu, color: Colors.blue, size: 28),
          SizedBox(width: 16),
        ],
      ),

      // ================= BODY =================
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Миний бичиг баримтууд",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Login",
                style: TextStyle(fontSize: 16, color: Colors.grey)),
          ),

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Төрд байгаа миний мэдээлэл",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),

          // ===== SERVICE LIST =====
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: services.length,
              itemBuilder: (_, i) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue.shade100),
                    color: Colors.grey.shade50,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(services[i]["icon"], color: Colors.blue),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          services[i]["title"],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // ================= FLOAT QR BUTTON =================
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {},
        child: const Icon(Icons.qr_code_scanner, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // ================= BOTTOM NAV =================
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, color: Colors.grey),
                  Text("Нүүр")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grid_view, color: Colors.grey),
                  Text("Үйлчилгээ")
                ],
              ),
              SizedBox(width: 40), // QR зай
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline, color: Colors.grey),
                  Text("Чат")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_outline, color: Colors.blue),
                  Text("Профайл")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
