import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/scrrens/variable.dart';
import 'package:home_service/util/my_button.dart';

import 'booking.dart';

class Provider extends StatefulWidget {
  const Provider({Key? key}) : super(key: key);

  @override
  State<Provider> createState() => _ProviderState();
}

class _ProviderState extends State<Provider> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    // int regIndex = ModalRoute.of(context)?.settings.arguments as int;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Providers"),
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
            )),
      ),
      body: SafeArea(
        left: true,
        right: true,
        top: true,
        minimum: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: ListView(
          children: [
            Text(
              Global.subCategory[index]['name'],
              style: const TextStyle(fontSize: 24),
            ),
            // (index==0)?Text(
            //   Global.subCategory[index]['name'],
            //   style: const TextStyle(fontSize: 24),
            // ):Text(
            //   Global.category[regIndex]['name'],
            //   style: const TextStyle(fontSize: 24),
            // ),
            SizedBox(height: h / 40),
            Text(
              Global.subCategory[index]['charge'],
              style: const TextStyle(fontSize: 20),
            ),
            SizedBox(height: h / 60),
            const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                "when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
            // ...Global.serviceProvider
            //     .map((e) => (e['service'] ==
            //              Global.subCategory[index]['category'])
            //         ? Card(
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(15),
            //             ),
            //             elevation: 2,
            //             child: Container(
            //               padding: const EdgeInsets.all(10),
            //               height: h / 4.2,
            //               decoration: BoxDecoration(
            //                 //color: Colors.blue,
            //                 borderRadius: BorderRadius.circular(15),
            //               ),
            //               child: Column(
            //                 children: [
            //                   Row(
            //                     children: [
            //                       CircleAvatar(
            //                         radius: 46,
            //                         backgroundColor: Colors.grey,
            //                         backgroundImage: AssetImage(e['image']),
            //                       ),
            //                       const SizedBox(width: 7),
            //                       Expanded(
            //                         child: Column(
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Text(e['name']),
            //                             Text(e['rate']),
            //                           ],
            //                         ),
            //                       ),
            //
            //                     ],
            //                   ),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   GestureDetector(
            //                     onTap: () {
            //                       Navigator.pushNamed(context, 'booking',
            //                           arguments:
            //                               Global.serviceProvider.indexOf(e));
            //                     },
            //                     child: Container(
            //                       height: h / 15,
            //                       width: w / 1.2,
            //                       decoration: BoxDecoration(
            //                           color: Colors.black,
            //                           borderRadius: BorderRadius.circular(30)),
            //                       alignment: Alignment.center,
            //                       child: const Text(
            //                         "Book now",
            //                         style: TextStyle(color: Colors.white),
            //                       ),
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           )
            //         : Container())
            //     .toList(),
            ...Global.serviceProvider
                .map((e) => (e['service'] == Global.category[index]['name'])
                    ? Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 2,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: h / 4.2,
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 46,
                                    backgroundColor: Colors.grey,
                                    backgroundImage: AssetImage(e['image']),
                                  ),
                                  const SizedBox(width: 7),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(e['name']),
                                        Text(e['rate']),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              MyButton(
                                text: "Book Now",
                                onTap: () {
                                  Navigator.pushNamed(context, 'booking',
                                      arguments:
                                          Global.serviceProvider.indexOf(e));
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container())
                .toList(),
          ],
        ),
      ),
    );
  }
}
