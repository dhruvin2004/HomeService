import 'package:flutter/material.dart';
import 'package:home_service/Admin/list.dart';
import 'package:home_service/util/my_button.dart';

import 'crud.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPage();
  }
}

class _AddPage extends State<AddPage> {
  final id = TextEditingController();
  final name = TextEditingController();
  final cat = TextEditingController();
  final det = TextEditingController();
  final exp = TextEditingController();
  final gen = TextEditingController();
  final img = TextEditingController();
  final price = TextEditingController();
  final rating = TextEditingController();
  final serImg = TextEditingController();
  final _docid = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final idField = TextFormField(
    //     controller: id,
    //     autofocus: false,
    //     validator: (value) {
    //       if (value == null || value.trim().isEmpty) {
    //         return 'This field is required';
    //       }
    //     },
    //     decoration: InputDecoration(
    //         contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //         hintText: "Name",
    //         border:
    //         OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final idField = TextFormField(
      controller: id,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "id",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
    final nameField = TextFormField(
      controller: name,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "Name",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );

    final catField = TextFormField(
      controller: cat,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "Category",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );

    final detField = TextFormField(
      controller: det,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "Details",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );

    final expField = TextFormField(
      controller: exp,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "Experience",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );

    final genField = TextFormField(
      controller: gen,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "Gender",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );

    final imgField = TextFormField(
      controller: img,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "Image",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );

    final priceField = TextFormField(
      controller: price,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "price",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );

    final ratingField = TextFormField(
      controller: rating,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "rating",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
    final serImgField = TextFormField(
      controller: serImg,
      //obscureText: obscureText,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: "provider image",
          hintStyle: TextStyle(color: Colors.grey[500])),
    );

    final viewListbutton = GestureDetector(
        onTap: () {
          Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListPage(),
            ), //To disable back feature set to false
          );
        },
        child: Text("View List of Employee"));
    final SaveButon = MyButton(
        text: "Save",
        onTap: () {
          setState(() async {
            if (_formKey.currentState!.validate()) {
              var response = await FirebaseCrud.addEmployee(
                id: id.text,
                name: name.text,
                Details: det.text,
                SerImage: serImg.text,
                Category: cat.text,
                Gender: gen.text,
                Rating: rating.text,
                Image: img.text,
                Experience: exp.text,
                Price: price.text,
              );

              if (response.code != 200) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response.message.toString()),
                      );
                    });
              } else {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(response.message.toString()),
                      );
                    });
              }
            }
          });
        });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)),
        title: const Text('FreeCode Spot'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    idField,
                    const SizedBox(height: 10.0),
                    nameField,
                    const SizedBox(height: 25.0),
                    catField,
                    const SizedBox(height: 25.0),
                    detField,
                    const SizedBox(height: 25.0),
                    imgField,
                    const SizedBox(height: 25.0),
                    serImgField,
                    const SizedBox(height: 25.0),
                    expField,
                    const SizedBox(height: 25.0),
                    genField,
                    const SizedBox(height: 25.0),
                    priceField,
                    const SizedBox(height: 25.0),
                    ratingField,
                    const SizedBox(height: 25.0),
                    viewListbutton,
                    const SizedBox(height: 45.0),
                    SaveButon,
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
