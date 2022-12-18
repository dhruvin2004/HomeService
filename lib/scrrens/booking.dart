
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    //int index = ModalRoute.of(context)?.settings.arguments as int;
    // double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
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
              color: Colors.black,
            )),
      ),
      body: ListView(
        children: [
          Center(
            child: CalendarTimeline(
              showYears: true,
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
              onDateSelected: (date) => setState(() => _selectedDate = date),
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: const Color(0xff00599D),
              dayNameColor: const Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: const Color(0xff00599D),
              dotsColor: Colors.white,
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
          ), const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal[200]),
              ),
              child: const Text(
                'RESET',
                style: TextStyle(color: Color(0xFF333A47)),
              ),
              onPressed: () => setState(() => _resetSelectedDate()),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              'Selected date is $_selectedDate',
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
