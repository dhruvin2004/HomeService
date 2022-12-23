import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_service/scrrens/variable.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();

    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }

  //
  // int _index = 0;
  int currentStep = 0;
  String groupValue = "";

  Widget title({required String text, required Icon icon}) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        )
      ],
    );
  }

  Widget payment(
      {required String text, required String value, required Icon icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.4,
            ),
          ),
          const Spacer(),
          Radio(
            value: value,
            activeColor: const Color(0xff111416),
            groupValue: groupValue,
            onChanged: (val) {
              setState(() {
                groupValue = val.toString();
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    // double h = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
        leading: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
            )),
        centerTitle: true,
      ),
      body: Form(
        key: Global.buyNowKey,
        child: Theme(
          data: ThemeData(
              colorScheme: const ColorScheme.light(primary: Colors.black)),
          child: Stepper(
            physics: const BouncingScrollPhysics(),
            elevation: 1,
            type: StepperType.vertical,
            currentStep: currentStep,
            controlsBuilder: (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    if (currentStep != 0)
                      Expanded(
                        child: ElevatedButton(
                          child: const Text("BACK"),
                          onPressed: () {
                            setState(() {
                              if (currentStep > 0) currentStep--;
                            });
                          },
                        ),
                      ),
                    if (currentStep != 0) const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        child:
                            Text(currentStep == 2 ? "CONFIRM" : "SAVE & NEXT"),
                        onPressed: () {
                          setState(() {
                            if (currentStep == 0) {
                              if (Global.buyNowKey.currentState!.validate()) {
                                if (currentStep < 2) currentStep++;
                                Global.buyNowKey.currentState!.save();
                              }
                            } else if (currentStep == 1) {
                              if (groupValue != "") {
                                if (currentStep < 2) currentStep++;
                              }
                            } else {
                              if (currentStep < 2) currentStep++;
                              Navigator.pushNamed(
                                context,
                                'order',
                              );
                              Global.myOrder.add(
                                Global.serviceProvider[index],
                              );

                              //orderService.add

                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            steps: [
              Step(
                state:
                    (currentStep > 0) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 0,
                title: const Text(
                  "Address",
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(
                        text: "Contact Details",
                        icon: const Icon(CupertinoIcons.phone)),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: Global.userName,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Name";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        hintText: "Full Name",
                        hintStyle: TextStyle(
                          color: Color(0xff707B82),
                          fontSize: 16,
                        ),
                        errorStyle: TextStyle(
                          letterSpacing: 0.2,
                        ),
                      ),
                      onSaved: (val) {
                        setState(() {
                          Global.userName = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      initialValue: Global.email,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Email address";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        hintText: "Email address",
                        hintStyle: TextStyle(
                          color: Color(0xff707B82),
                          fontSize: 16,
                        ),
                        errorStyle: TextStyle(
                          letterSpacing: 0.2,
                        ),
                      ),
                      onSaved: (val) {
                        setState(() {
                          Global.email = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      initialValue: Global.userPhone,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Phone Number";
                        }
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(
                          color: Color(0xff707B82),
                          fontSize: 16,
                        ),
                        errorStyle: TextStyle(
                          letterSpacing: 0.2,
                        ),
                      ),
                      onSaved: (val) {
                        setState(() {
                          Global.userPhone = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    title(
                        text: "Address",
                        icon: const Icon(Icons.location_on_outlined)),
                    const SizedBox(height: 10),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: Global.userAdd,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Your Address";
                        }
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xff707B82),
                          ),
                        ),
                        hintText: "Address",
                        hintStyle: TextStyle(
                          color: Color(0xff707B82),
                          fontSize: 16,
                        ),
                        errorStyle: TextStyle(
                          letterSpacing: 0.2,
                        ),
                      ),
                      onSaved: (val) {
                        setState(() {
                          Global.userAdd = val.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            initialValue: Global.userPinCode,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Pin Code";
                              }
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              hintText: "Pin Code",
                              hintStyle: TextStyle(
                                color: Color(0xff707B82),
                                fontSize: 16,
                              ),
                              errorStyle: TextStyle(
                                letterSpacing: 0.2,
                              ),
                            ),
                            onSaved: (val) {
                              setState(() {
                                Global.userPinCode = val.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: Global.userCity,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Your City";
                              }
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              hintText: "City",
                              hintStyle: TextStyle(
                                color: Color(0xff707B82),
                                fontSize: 16,
                              ),
                              errorStyle: TextStyle(
                                letterSpacing: 0.2,
                              ),
                            ),
                            onSaved: (val) {
                              setState(() {
                                Global.userCity = val.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: Global.userState,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Your State";
                              }
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              hintText: "State",
                              hintStyle: TextStyle(
                                color: Color(0xff707B82),
                                fontSize: 16,
                              ),
                              errorStyle: TextStyle(
                                letterSpacing: 0.2,
                              ),
                            ),
                            onSaved: (val) {
                              setState(() {
                                Global.userState = val.toString();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            initialValue: Global.userCountry,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Your Country";
                              }
                            },
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff707B82),
                                ),
                              ),
                              hintText: "Country",
                              hintStyle: TextStyle(
                                color: Color(0xff707B82),
                                fontSize: 16,
                              ),
                              errorStyle: TextStyle(
                                letterSpacing: 0.2,
                              ),
                            ),
                            onSaved: (val) {
                              setState(() {
                                Global.userCountry = val.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Step(
                state:
                    (currentStep > 1) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 1,
                title: const Text(
                  "Payment",
                  style: TextStyle(),
                ),
                content: Column(
                  children: [
                    payment(
                        text: "UPI (GPay / PhonePe)",
                        icon: const Icon(CupertinoIcons.briefcase, size: 26),
                        value: 'UPI (GPay / PhonePe)'),
                    payment(
                        text: "Wallet",
                        icon: const Icon(Icons.account_balance_wallet_outlined,
                            size: 26),
                        value: 'Wallet'),
                    payment(
                        text: "Debit / Credit Card",
                        icon: const Icon(Icons.credit_card_rounded, size: 26),
                        value: 'Debit / Credit Card'),
                    payment(
                        text: "Net Banking",
                        icon: const Icon(Icons.account_balance_outlined,
                            size: 26),
                        value: 'Net Banking'),
                    payment(
                        text: "Cash on Delivery",
                        icon: const Icon(CupertinoIcons.money_dollar_circle,
                            size: 26),
                        value: 'Cash on Delivery'),
                  ],
                ),
              ),
              Step(
                state:
                    (currentStep > 2) ? StepState.complete : StepState.indexed,
                isActive: currentStep >= 2,
                title: const Text(
                  "Details",
                ),
                content: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: width,
                      child: Row(
                        children: [
                          Image.asset(Global.serviceProvider[index]['image'],
                              height: 60),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width / 2.6,
                                child: Text(
                                  Global.serviceProvider[index]['name'],
                                  maxLines: 2,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Text(
                                "${Global.serviceProvider[index]['service']}",
                                style: const TextStyle(
                                  color: Color(0xff858589),
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Text(
                                "₹ ${Global.serviceProvider[index]['charge'].toString()}",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Delivery Address",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${Global.userName} \n+91 ${Global.userPhone}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${Global.userAdd}, ${Global.userCity}, ${Global.userState}, ${Global.userCountry} - ${Global.userPinCode}",
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Mode",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        groupValue,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 18,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 1,
                      color: const Color(0xff111416),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
