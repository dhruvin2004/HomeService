import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/scrrens/variable.dart';

import '../Admin/admin.dart';
import 'Home.dart';
import 'account.dart';
import 'order.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  late List titleName = [
    "Home",
    "Order",
    (user.uid == "IpgTv6GlSxWpOJxSj29jYfT3VSg1") ? "Admin" : "Account"
  ];
  late List page = [
    Home(),
    Order(),
    (user.uid == "IpgTv6GlSxWpOJxSj29jYfT3VSg1") ? Admin() : Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 30,
        elevation: 0,
        title: Text(
          titleName[currentIndex],
          style: const TextStyle(
              fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
      ),
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.calendar_today),
            label: "Order",
          ),
          (user.uid != "IpgTv6GlSxWpOJxSj29jYfT3VSg1")
              ? const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_crop_rectangle),
                  label: "Account")
              : const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person_crop_rectangle),
                  label: "Admin"),
        ],
      ),
    );
  }
}
