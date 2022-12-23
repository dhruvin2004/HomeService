import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Admin/admin.dart';
import 'Chat.dart';
import 'Home.dart';
import 'account.dart';
import 'order.dart';

class Employee {
  String? ID;
  String? name;
  String? Category;
  String? Details;
  String? Gender;
  String? Image;
  String? Experience;
  String? Price;
  String? Rating;

  // String? position;
  // String? contactno;

  Employee({
    this.ID,
    this.name,
    this.Category,
    this.Details,
    this.Experience,
    this.Gender,
    this.Image,
    this.Rating,
    this.Price,
    // this.position,
    // this.contactno,
  });
}

class Response {
  int? code;
  String? message;

  Response({this.code, this.message});
}

class Global {
  static bool isSearch = false;
  static bool Intro = false;
  static final user = FirebaseAuth.instance.currentUser!;
  static File? image;

  //ProfilePage Controller & Variable
  // static String fname = "";
  // static String lname = "";
  // static String email = "";
  // static String phone = "";
  // static String city = "";
  // static String area = "";
  // static String society = "";
  // static String a_no = "";
  static TextEditingController fnameController = TextEditingController();
  static TextEditingController lnameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController cityController = TextEditingController();
  static TextEditingController areaController = TextEditingController();
  static TextEditingController societyController = TextEditingController();
  static TextEditingController a_noController = TextEditingController();

  static List carousel = [
    "image/1.png",
    "image/2.png",
    "image/3.png",
    "image/4.png",
    "image/5.png",
  ];
  static List<Map<String, dynamic>> category = [
    {
      'name': 'House Cleaning',
      'image': 'image/main/house.png',
      'type': 'monthly',
    },
    {
      'name': 'Plumbing Service',
      'image': 'image/main/plumbing.png',
      'type': 'monthly',
    },
    {
      'name': 'Salon Service',
      'image': 'image/main/salon.png',
      'type': 'monthly',
    },
    {
      'name': 'Carpenter Service',
      'image': 'image/main/carpenter.png',
      'type': 'monthly'
    },
    {
      'name': 'Pest control',
      'image': 'image/main/pestC.png',
      'type': 'monthly'
    },
    {
      'name': 'Appliances repair',
      'image': 'image/main/appliances.png',
      'type': 'monthly'
    },
    {
      'name': 'Dog walker',
      'image': 'image/main/dog.png',
      'type': 'regular',
    },
    {
      'name': 'Car Washer',
      'image': 'image/main/car.png',
      'type': 'regular',
    },
    {
      'name': 'Baby sitter',
      'image': 'image/main/baby.png',
      'type': 'regular',
    },
    {
      'name': 'News paper',
      'image': 'image/main/news.png',
      'type': 'regular',
    },
    {
      'name': 'Cook',
      'image': 'image/main/cook.png',
      'type': 'regular',
    },
    {
      'name': 'Gardener',
      'image': 'image/main/gardner.png',
      'type': 'regular',
    },
  ];

  static List<Map<String, dynamic>> subCategory = [
    {
      'name': 'Floor Cleaning',
      'image': 'image/subCat/floor.png',
      'charge': 'minimum 400/-',
      'category': 'House Cleaning',
    },
    {
      'name': 'Carpet Cleaning',
      'image': 'image/subCat/carpet.png',
      'charge': 'minimum 400/-',
      'category': 'House Cleaning',
    },
    {
      'name': 'Sofa wash',
      'image': 'image/subCat/sofa.png',
      'charge': 'minimum 400/-',
      'category': 'House Cleaning',
    },
    {
      'name': 'Window Cleaning',
      'image': 'image/subCat/window.png',
      'charge': 'minimum 400/-',
      'category': 'House Cleaning',
    },
    {
      'name': 'Bathroom Cleaning',
      'image': 'image/subCat/bathroom.png',
      'charge': 'minimum 400/-',
      'category': 'House Cleaning',
    },
    {
      'name': 'Full Home Cleaning',
      'image': 'image/subCat/fullclean.png',
      'charge': 'minimum 400/-',
      'category': 'House Cleaning',
    },
    {
      'name': 'Refrigerator repair',
      'image': 'image/subCat/fridger.png',
      'charge': 'minimum 400/-',
      'category': 'Appliances repair',
    },
    {
      'name': 'AC Service and repair',
      'image': 'image/subCat/ac.png',
      'charge': 'minimum 400/-',
      'category': 'Appliances repair',
    },
    {
      'name': 'Washing machine repair',
      'image': 'image/subCat/washingM.png',
      'charge': 'minimum 400/-',
      'category': 'Appliances repair',
    },
    {
      'name': 'Fan repair',
      'image': 'image/subCat/fan.png',
      'charge': 'minimum 400/-',
      'category': 'Appliances repair',
    },
    {
      'name': 'Microwave repair',
      'image': 'image/subCat/microwave.png',
      'charge': 'minimum 400/-',
      'category': 'Appliances repair',
    },
    {
      'name': 'Dish washer repair',
      'image': 'image/subCat/dishwash.png',
      'charge': 'minimum 400/-',
      'category': 'Appliances repair',
    },
    {
      'name': 'Drainage Services',
      'image': 'image/subCat/drain.png',
      'charge': 'minimum 400/-',
      'category': 'Plumbing Service',
    },
    {
      'name': 'Installation and repairing',
      'image': 'image/subCat/tap.png',
      'charge': 'minimum 400/-',
      'category': 'Plumbing Service',
    },
    {
      'name': 'Blockage and leak',
      'image': 'image/subCat/leak.png',
      'charge': 'minimum 400/-',
      'category': 'Plumbing Service',
    },
    {
      'name': 'Disinfection',
      'image': 'image/subCat/disin.png',
      'charge': 'minimum 400/-',
      'category': 'Pest control',
    },
    {
      'name': 'Disinsection',
      'image': 'image/subCat/disinsect.png',
      'charge': 'minimum 400/-',
      'category': 'Pest control',
    },
    {
      'name': 'Rat control',
      'image': 'image/subCat/rat.png',
      'charge': 'minimum 400/-',
      'category': 'Pest control',
    },
    {
      'name': 'Bird netting',
      'image': 'image/subCat/bird.png',
      'charge': 'minimum 400/-',
      'category': 'Pest control',
    },
    {
      'name': 'Hair color',
      'image': 'image/subCat/haircolor.png',
      'charge': 'minimum 400/-',
      'category': 'Salon Service',
    },
    {
      'name': 'Hair cut',
      'image': 'image/subCat/hair cut.png',
      'charge': 'minimum 400/-',
      'category': 'Salon Service',
    },
    {
      'name': 'Hair style',
      'image': 'image/subCat/hairS.png',
      'charge': 'minimum 400/-',
      'category': 'Salon Service',
    },
    {
      'name': 'Make up',
      'image': 'image/subCat/make.png',
      'charge': 'minimum 400/-',
      'category': 'Salon Service',
    },
    {
      'name': 'Waxing',
      'image': 'image/subCat/wax.png',
      'charge': 'minimum 400/-',
      'category': 'Salon Service',
    },
    {
      'name': 'Threading and Face wax',
      'image': 'image/subCat/eye.png',
      'charge': 'minimum 400/-',
      'category': 'Salon Service',
    },
    {
      'name': 'Pedicure and Manicure',
      'image': 'image/subCat/manicure.png',
      'charge': 'minimum 400/-',
      'category': 'Salon Service',
    },
    {
      'name': 'Facial',
      'image': 'image/subCat/facial.png',
      'charge': 'minimum 400/-',
      'category': 'Salon Service',
    },
    {
      'name': 'Interior decor',
      'image': 'image/subCat/interior.png',
      'charge': 'minimum 400/-',
      'category': 'Carpenter Service',
    },
    {
      'name': 'Door,windows and lock fittings',
      'image': 'image/subCat/door.png',
      'charge': 'minimum 400/-',
      'category': 'Carpenter Service',
    },
    {
      'name': 'Furniture repair',
      'image': 'image/subCat/furniture.png',
      'charge': 'minimum 400/-',
      'category': 'Carpenter Service',
    },
    {
      'name': 'Modular kitchen work',
      'image': 'image/subCat/kitchen.png',
      'charge': 'minimum 400/-',
      'category': 'Carpenter Service',
    },
    {
      'name': 'Wood polish',
      'image': 'image/subCat/wood.png',
      'charge': 'minimum 400/-',
      'category': 'Carpenter Service',
    },
  ];
  static List<Map<String, dynamic>> serviceProvider = [
    {
      'name': 'Christopher Campbell',
      'image': 'image/serPro/servicePro1.jpg',
      'service': 'House Cleaning',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 500,
    },
    {
      'name': 'Edward Cisneros',
      'image': 'image/serPro/servicePro3.jpg',
      'service': 'House Cleaning',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 650,
    },
    {
      'name': 'Edward Cisneros',
      'image': 'image/serPro/servicePro3.jpg',
      'service': 'Plumbing Service',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 550,
    },
    {
      'name': 'Gian Cesco n',
      'image': 'image/serPro/servicePro2.jpg',
      'service': 'Salon Service',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 700,
    },
    {
      'name': 'Rian Robert',
      'image': 'image/serPro/servicePro4.jpg',
      'service': 'Carpenter Service',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 1000,
    },
    {
      'name': 'Vince Vera s',
      'image': 'image/serPro/servicePro5.jpg',
      'service': 'Pest control',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 1200,
    },
    {
      'name': 'Rahul jain',
      'image': 'image/serPro/servicePro7.jpeg',
      'service': 'Appliances repair',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 900,
    },
    {
      'name': 'Matheus Ferraro',
      'image': 'image/serPro/servicePro12.jpg',
      'service': 'Car Washer',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 600,
    },
    {
      'name': 'Rose Gonzalez',
      'image': 'image/serPro/servicePro6.jpg',
      'service': 'Dog walker',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 770,
    },
    {
      'name': 'May Gauthier',
      'image': 'image/serPro/servicePro8.jpeg',
      'service': 'Baby sitter',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 550,
    },
    {
      'name': 'Toa heftily',
      'image': 'image/serPro/servicePro10.jpg',
      'service': 'News paper',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 10,
    },
    {
      'name': 'Zoe Fernandez',
      'image': 'image/serPro/servicePro9.jpg',
      'service': 'Cook',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 650,
    },
    {
      'name': 'Christ Carn',
      'image': 'image/serPro/servicePro.jpg',
      'service': 'Gardener',
      'details':
          'Contrary to popular belief, Lorem Ipsum is not simply random text. '
              'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
      'rate': '4 ⭐',
      'charge': 850,
    },
  ];

  static List myOrder = [];
  static List<Map<String, dynamic>> orderService = [];
  static GlobalKey<FormState> buyNowKey = GlobalKey<FormState>();
  static String email = '',
      userName = "",
      userAdd = "",
      userPhone = "",
      userPinCode = "",
      userCity = "",
      userState = "",
      userCountry = "";
}

String currentName = "Home";
int currentIndex = 0;
final controller = PageController(viewportFraction: 0.8, keepPage: true);
