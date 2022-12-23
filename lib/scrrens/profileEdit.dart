import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_service/scrrens/homePage.dart';
import 'package:home_service/scrrens/variable.dart';
import 'package:home_service/util/my_button.dart';
import 'package:home_service/util/my_textfield.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final _formKey = GlobalKey<FormState>();

  //late SharedPreferences prefe;

  getImage() async {
    PickedFile? pic = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 600, maxWidth: 600);
    if (pic != null) {
      setState(() {
        Global.image = File(pic.path);
      });
    }
  }

  getGallery() async {
    PickedFile? pic = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 600, maxWidth: 600);
    if (pic != null) {
      setState(() {
        Global.image = File(pic.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // data();
  }

  // data() async {
  //   prefe = await SharedPreferences.getInstance();
  //   Global.image = prefe.getString('image') as File?;
  //   Global.fnameController = prefe.getString('fname')! as TextEditingController;
  //   Global.lnameController = prefe.getString('lname')! as TextEditingController;
  //   Global.phoneController = prefe.getString('mobile')! as TextEditingController;
  //   Global.cityController = prefe.getString('city')! as TextEditingController;
  //   Global.areaController = prefe.getString('area')! as TextEditingController;
  //   Global.societyController = prefe.getString('society')! as TextEditingController;
  //   Global.a_noController = prefe.getString('a_no')! as TextEditingController;
  // }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  (Global.image == null)
                      ? const CircleAvatar(
                          maxRadius: 80,
                          backgroundColor: Color(0xFFEEEEEE),
                          child:
                              Icon(Icons.image, size: 100, color: Colors.black),
                        )
                      : CircleAvatar(
                          maxRadius: 80,
                          backgroundImage: FileImage(Global.image!),
                        ),
                  Positioned(
                    top: 130,
                    left: 100,
                    child: SizedBox(
                      height: 30,
                      child: FloatingActionButton(
                        backgroundColor: Colors.black,
                        onPressed: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Expanded(
                                  child: AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    actions: [
                                      Container(
                                        width: w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  getImage();
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text(
                                                "Camera",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  getGallery();
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text(
                                                "Gallery",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: Global.fnameController,
                  hintText: "First Name",
                  obscureText: false),
              const SizedBox(
                height: 5,
              ),
              MyTextField(
                  controller: Global.lnameController,
                  hintText: "Last Name",
                  obscureText: false),
              const SizedBox(
                height: 5,
              ),
              MyTextField(
                  controller: Global.phoneController,
                  hintText: "Mobile Number",
                  obscureText: false),
              const SizedBox(
                height: 5,
              ),
              MyTextField(
                  controller: Global.cityController,
                  hintText: "City",
                  obscureText: false),
              const SizedBox(
                height: 5,
              ),
              MyTextField(
                  controller: Global.areaController,
                  hintText: "Area",
                  obscureText: false),
              const SizedBox(
                height: 5,
              ),
              MyTextField(
                  controller: Global.societyController,
                  hintText: "Society",
                  obscureText: false),
              const SizedBox(
                height: 5,
              ),
              MyTextField(
                  controller: Global.a_noController,
                  hintText: "Apartment No",
                  obscureText: false),
              const SizedBox(
                height: 25,
              ),
              MyButton(
                  text: "Save",
                  onTap: () async {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                        (route) => false);
                    // SharedPreferences prefe =
                    //     await SharedPreferences.getInstance();
                    setState(() {
                      // prefe.setString('image', Global.image.toString());
                      // prefe.setString('fname', Global.fnameController.text);
                      // prefe.setString('lname', Global.lnameController.text);
                      // prefe.setString('mobile', Global.phoneController.text);
                      // prefe.setString('city', Global.cityController.text);
                      // prefe.setString('area', Global.areaController.text);
                      // prefe.setString('society', Global.societyController.text);
                      // prefe.setString('a_no', Global.a_noController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: const Text("Your Profile is Update"),
                          backgroundColor: Colors.black,
                          duration: const Duration(seconds: 3),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          action: SnackBarAction(
                            onPressed: () {},
                            label: "Dismiss",
                            textColor: Colors.white,
                          ),
                          margin: const EdgeInsets.all(15),
                        ),
                      );
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
