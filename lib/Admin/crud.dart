import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_service/scrrens/details.dart';

import '../scrrens/variable.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Employee');

class FirebaseCrud {
//CRUD method here

//add
  static Future<Response> addEmployee({
    required String id,
    required String name,
    required String Category,
    required String Details,
    required String Gender,
    required String Image,
    required String Experience,
    required String Price,
    required String Rating,
    required String SerImage,

    // required String position,
    // required String contactno,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      'ID': id,
      'Name': name,
      'Category': Category,
      'Details': Details,
      'Experience': Experience,
      'Gender': Gender,
      'Image': Image,
      'Price': Price,
      'Rating': Rating,
      'SerImage': SerImage
      //   "position": position,
      //   "contact_no": contactno
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });
    return response;
  }

  static Stream<QuerySnapshot> readEmployee() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

//update
  static Future<Response> updateEmployee({
    required String id,
    required String name,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      'id': id,
      "name": name,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully updated Employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

//delete
  static Future<Response> deleteEmployee({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully Deleted Employee";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
