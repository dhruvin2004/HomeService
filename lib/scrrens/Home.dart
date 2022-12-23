import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/scrrens/variable.dart';

import '../Admin/crud.dart';
import '../Admin/edit.dart';
import '../util/widget.dart';
import 'homePage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedService = -1;
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.readEmployee();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      left: true,
      right: true,
      top: true,
      child: ListView(
        physics: const ScrollPhysics(),
        children: [
          SizedBox(
            height: 80,
            width: w,
            child: Stack(
              children: [
                Container(
                  height: 60,
                  width: w,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width: w,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 0),
                            blurRadius: 8),
                      ],
                    ),
                    child: CupertinoSearchTextField(
                      onTap: () {
                        setState(() {});
                      },
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
            items: [
              ...Global.carousel
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(e),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
            options: CarouselOptions(
              height: 220.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.95,
            ),
          ),
          details(
              text1: 'Monthly services',
              text2: 'view all',
              ontap: () {
                setState(() {
                  Navigator.of(context).pushNamed("monthlyService");
                  Curves.linear;
                });
              }),
          Container(
            height: 160,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: Global.category
                  .map(
                    (e) => (e['type'] == 'monthly')
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.of(context).pushNamed("subCategory",
                                    arguments: Global.category.indexOf(e));
                                if (selectedService ==
                                    Global.category.indexOf(e)) {
                                  selectedService = -1;
                                } else {
                                  selectedService = Global.category.indexOf(e);
                                }
                              });
                            },
                            child: AnimatedContainer(
                              width: 160,
                              margin: const EdgeInsets.only(right: 8),
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: selectedService ==
                                        Global.category.indexOf(e)
                                    ? Colors.blue.shade50
                                    : Colors.grey.shade100,
                                border: Border.all(
                                  color: selectedService ==
                                          Global.category.indexOf(e)
                                      ? Colors.blue
                                      : Colors.blue.withOpacity(0),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(e['image'], height: 100),
                                    AutoSizeText(
                                      e['name'],
                                      style: const TextStyle(fontSize: 16),
                                    )
                                  ]),
                            ),
                          )
                        : Container(),
                  )
                  .toList(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              "Service Provider",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          StreamBuilder(
            stream: collectionReference,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    children: snapshot.data!.docs.map((e) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: AnimatedContainer(
                          height: 120,
                          width: w,
                          margin: const EdgeInsets.only(right: 8, bottom: 10),
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(
                              color: Colors.blue.withOpacity(0),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                e['ID'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                  e['SerImage'],
                                ),
                                radius: 50,
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  AutoSizeText(
                                    e['Name'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  AutoSizeText(
                                    e['Category'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey.shade400),
                                  ),
                                  AutoSizeText(
                                    e['Rating'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey.shade400),
                                  ),
                                  Spacer(),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

class MonthlyService extends StatefulWidget {
  const MonthlyService({Key? key}) : super(key: key);

  @override
  State<MonthlyService> createState() => _MonthlyServiceState();
}

class _MonthlyServiceState extends State<MonthlyService> {
  int selectedService = -1;
  int? i;

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
            child: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: const Text(
          "Monthly Service",
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        left: true,
        right: true,
        top: true,
        minimum: const EdgeInsets.symmetric(horizontal: 5),
        child: GridView.count(
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 2,
          padding: const EdgeInsets.all(10),
          children: [
            ...Global.category
                .map((e) => GestureDetector(
                      onTap: () {
                        setState(() {
                          if (selectedService == Global.category.indexOf(e)) {
                            selectedService = -1;
                          } else {
                            selectedService = Global.category.indexOf(e);
                          }
                          Navigator.of(context).pushNamed("subCategory",
                              arguments: Global.category.indexOf(e));
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: AnimatedContainer(
                          width: 160,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: selectedService == Global.category.indexOf(e)
                                ? Colors.blue.shade50
                                : Colors.grey.shade100,
                            border: Border.all(
                              color:
                                  selectedService == Global.category.indexOf(e)
                                      ? Colors.blue
                                      : Colors.blue.withOpacity(0),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(e['image'], height: 100),
                                AutoSizeText(
                                  e['name'],
                                  style: const TextStyle(fontSize: 16),
                                )
                              ]),
                        ),
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
