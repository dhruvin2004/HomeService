import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/util/my_button.dart';

class Details extends StatefulWidget {
  final String image;
  final String name;
  final String experiance;
  final String rate;
  final String category;
  final String price;

  const Details(
      {super.key,
      required this.image,
      required this.name,
      required this.category,
      required this.experiance,
      required this.rate,
      required this.price});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
            child: Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          "Providers Details",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 250,
              width: w,
              decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey5,
                  image: DecorationImage(image: AssetImage(widget.image))),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "${widget.name}",
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "${widget.category}",
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "₹ ${widget.price}",
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    width: w,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${widget.experiance}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 60,
                    width: w,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${widget.rate}",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "About",
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum ipsum congue risus iaculis, id auctor ante fringilla. Morbi consectetur mattis tortor vel fermentum. Pellentesque vestibulum, justo bibendum ultrices lacinia, turpis purus semper mi, sed dapibus nunc ligula eu nulla. Quisque cursus efficitur enim,",
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
