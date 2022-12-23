import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:home_service/scrrens/variable.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return (Global.myOrder.isEmpty)
        ? Center(
            child: Text("You don't have any order yet"),
          )
        : ListView(
            padding: EdgeInsets.all(16),
            children: [
              ...Global.myOrder
                  .map(
                    (e) => Slidable(
                      key: const ValueKey(0),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            flex: 2,
                            onPressed: (val) {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        title: const Text(
                                            "Are you sure for cancel you order?"),
                                        insetAnimationCurve: Curves.linear,
                                        actions: [
                                          CupertinoButton(
                                            onPressed: () {
                                              setState(() {
                                                Global.myOrder.remove(e);
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
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Container(
                        height: 150,
                        width: w,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage(e['image']),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      e['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  e['service'],
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "₹ ${e['charge'].toString()}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          );
  }
}
