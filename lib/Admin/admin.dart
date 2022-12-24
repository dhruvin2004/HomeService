import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/Admin/add.dart';

import '../scrrens/account.dart';
import '../scrrens/variable.dart';
import '../util/widget.dart';
import 'edit.dart';
import 'list.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: (Global.image == null)
                    ? const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 40,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(Global.image!),
                        maxRadius: 40,
                      ),
              ),
              const SizedBox(
                width: 20,
              ),
              (Global.fnameController.text.isEmpty)
                  ? const Text(
                      "Admin",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    )
                  : Text(
                      "${Global.fnameController.text} ${Global.lnameController.text} ",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
          listTile(
              icons: Icons.edit_note_sharp,
              title: "Edit Profile",
              ontap: () {
                setState(() {
                  Navigator.pushNamed(context, 'profile');
                  Curves.linear;
                });
              }),
          listTile(
              icons: Icons.add,
              title: "add",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPage(),
                    ));
              }),
          listTile(
              icons: Icons.list,
              title: "view list",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPage(),
                    ));
              }),
          (Global.phoneController.text.isEmpty)
              ? Container()
              : Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.phone_fill),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${Global.phoneController.text}",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.mail_solid),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("${user.email}")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
          listTile(
              icons: Icons.feedback,
              title: "Feedback",
              ontap: () {
                setState(() {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    // set to false if you want to force a rating
                    builder: (context) => FeedBack(),
                  );
                });
              }),
          listTile(
              icons: Icons.help,
              title: "About Us",
              ontap: () {
                setState(() {
                  Navigator.pushNamed(context, 'help');
                });
              }),
          listTile(
              icons: Icons.contacts,
              title: "Contact Us",
              ontap: () {
                setState(() {
                  Navigator.pushNamed(context, 'contact');
                });
              }),
          ListTile(
            leading: const Icon(
              CupertinoIcons.square_arrow_right_fill,
              size: 28,
              color: Colors.redAccent,
            ),
            title: const Text(
              "Log out",
              style: TextStyle(
                  color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            selected: true,
            onTap: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text("Are you sure?"),
                        insetAnimationCurve: Curves.linear,
                        actions: [
                          CupertinoButton(
                            onPressed: () {
                              setState(() {
                                FirebaseAuth.instance.signOut();
                                Navigator.pop(context);
                              });
                            },
                            child: const Text("Yes"),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: const Text("No"),
                          ),
                        ],
                      );
                    });
              });
            },
          ),
        ],
      ),
    );
  }
}
