import 'package:flutter/material.dart';
import 'package:home_service/scrrens/variable.dart';
import 'package:home_service/util/my_button.dart';
import 'package:home_service/util/my_textfield.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
                Curves.linear;
              });
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          "Profile Edit",
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            MyTextField(
                controller: Global.nameController,
                hintText: "First Name",
                obscureText: false),
            const SizedBox(
              height: 5,
            ),
            MyTextField(
                controller: Global.nameController,
                hintText: "Last Name",
                obscureText: false),
            const SizedBox(
              height: 5,
            ),
            MyTextField(
                controller: Global.nameController,
                hintText: "Email Address",
                obscureText: false),
            const SizedBox(
              height: 5,
            ),
            MyTextField(
                controller: Global.nameController,
                hintText: "Mobile Number",
                obscureText: false),
            const SizedBox(
              height: 5,
            ),
            MyTextField(
                controller: Global.nameController,
                hintText: "City",
                obscureText: false),
            const SizedBox(
              height: 5,
            ),
            MyTextField(
                controller: Global.nameController,
                hintText: "Area",
                obscureText: false),
            const SizedBox(
              height: 5,
            ),
            MyTextField(
                controller: Global.nameController,
                hintText: "Society",
                obscureText: false),
            const SizedBox(
              height: 5,
            ),
            MyTextField(
                controller: Global.nameController,
                hintText: "Apartment No",
                obscureText: false),
            const SizedBox(
              height: 25,
            ),
            MyButton(text: "Save", onTap: () {}),
          ],
        ),
      ),
    );
  }
}