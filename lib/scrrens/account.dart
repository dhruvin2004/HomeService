import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/scrrens/variable.dart';
import 'package:home_service/util/widget.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  //--------------------------------
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
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
                    "User",
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
            icons: Icons.edit_note_sharp,
            title: "Edit Profile",
            ontap: () {
              setState(() {
                Navigator.pushNamed(context, 'profile');
                Curves.linear;
              });
            }),
        listTile(icons: Icons.store, title: "My Order", ontap: () {}),
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
    );
  }
}

class FeedBack extends StatefulWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      initialRating: 0.8,
      title: const Text(
        'Home Service App',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message: const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
      image: CircleAvatar(
        radius: 65,
        backgroundColor: Colors.white,
        child: Image.asset(
          "image/logo/homelogo.png",
          height: 100,
        ),
      ),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {},
    );
  }
}
