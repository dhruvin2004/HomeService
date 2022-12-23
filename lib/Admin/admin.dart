import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/Admin/add.dart';

import '../util/widget.dart';
import 'edit.dart';
import 'list.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
