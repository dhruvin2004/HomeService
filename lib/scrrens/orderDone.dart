import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class orderDone extends StatefulWidget {
  const orderDone({Key? key}) : super(key: key);

  @override
  State<orderDone> createState() => _orderDoneState();
}

class _orderDoneState extends State<orderDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset('image/done.gif', height: 200),
            const SizedBox(height: 10),
            const Text(
              "Your Order\nHas Been Accepted",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff111416),
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Your service will be available at your home soon.\nThank You For Choosing our App!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  //Global.books[Global.index]['quantity'] = 1;
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'home', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Home Page",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
