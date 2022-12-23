import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("About Us"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Why Choose us?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "- Because we'll make you more money with customer-focused, convincing copy that sells harder.\n- Because we've been there and done it. ...\n- Because we're chosen by professionals. ...\n- Because we know digital. ...\n- Because we don't cost the earth. ...\n- Because we'll understand your brand. ...\n- Because we're easy to work with",
              style: TextStyle(color: Colors.grey.shade500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "How we do it?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "- our provides a platform that allows skilled and\n   experienced professionals to connect with users\n   looking for specific services. Once on the platform,\n   our match-making algorithm identifies\n   professionals who are closest to the users’ \n  requirements and available at the requested time\n  and date.",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  _callNumber() async {
    const number = '9023056209';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

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
              });
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("Contact Us"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey.shade300,
                child: FlutterLogo(
                  size: 120,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "We are always ready to cooperate.\nWrite to us & we will contact you.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "EMAIL",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'dhruvinpandav999@gmail.com',
                  );
                  launchUrl(emailLaunchUri);
                });
              },
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(
                        Icons.email,
                        color: Colors.grey.shade500,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "dhruvinpandav999@gmail.com",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Phone",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _callNumber();
                });
              },
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(
                        Icons.phone,
                        color: Colors.grey.shade500,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "+91 9023056209",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
