import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/scrrens/variable.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({Key? key}) : super(key: key);

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  int selectedService = -1;
  int? i;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
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
            child: const Icon(
              Icons.arrow_back_ios_new,
            )),
        title: Text(
          Global.category[index]['name'],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        left: true,
        right: true,
        top: true,
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Text(
                "${Global.category.length} services in ${Global.category[index]['name']}"),
            ...Global.subCategory.map((e) {
              if (Global.category[index]['name'] == e['category']) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      i = Global.subCategory.indexOf(e);
                      Navigator.of(context).pushNamed("provider",
                          arguments: Global.subCategory.indexOf(e));
                      if (selectedService == Global.subCategory.indexOf(e)) {
                        selectedService = -1;
                      } else {
                        selectedService = Global.subCategory.indexOf(e);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    width: w,
                    margin: const EdgeInsets.only(right: 8, bottom: 8),
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      color: selectedService == Global.subCategory.indexOf(e)
                          ? Colors.blue.shade50
                          : Colors.grey.shade100,
                      border: Border.all(
                        color: selectedService == Global.subCategory.indexOf(e)
                            ? Colors.blue
                            : Colors.blue.withOpacity(0),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(children: <Widget>[
                      Image.asset(e['image'], height: 100),
                      AutoSizeText(
                        e['name'],
                        maxLines: 2,
                        style: const TextStyle(fontSize: 16),
                      )
                    ]),
                  ),
                );
              }
              return Container();
            }).toList(),
          ],
        ),
      ),
    );
  }
}
