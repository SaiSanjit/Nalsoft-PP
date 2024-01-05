import "package:flutter/material.dart";
import 'package:mess_management/providers/userModel.dart';
import "package:provider/provider.dart";
import "package:table_calendar/table_calendar.dart";

void main() {
  runApp(MaterialApp(
    home: SafeArea(
        child: ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: UpdateLunchStatus(),
    )),
  ));
}

class UpdateLunchStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        // title: const Text("Lunch Status"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_box_rounded))
        ],
        backgroundColor: Color.fromRGBO(179, 110, 234, 100),
        elevation: 4,
        toolbarHeight: 65,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(236, 230, 240, 100),
                borderRadius: BorderRadius.circular(12)),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(top: 16, left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Reason"),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter the reason for the update...",
                      hintStyle: TextStyle(color: Colors.black38),
                      border: InputBorder.none),
                )
              ],
            ),
          ),
          UpdateStatusCalender(),
          Expanded(child: SizedBox()),
          ElevatedButton(onPressed: () {}, child: Text("Save")),
          Image.asset("assets/images/food.png"),
        ],
      ),
    );
  }
}

class UpdateStatusCalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currentDay = DateTime.now();
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(236, 230, 240, 100),
          borderRadius: BorderRadius.circular(25)),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TableCalendar(
        // rowHeight: 80,

        currentDay: DateTime.now(),
        focusedDay: DateTime.now(),
        firstDay: DateTime(2023),
        lastDay: DateTime(2025),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontSize: 18),
          leftChevronIcon: Icon(Icons.chevron_left),
          rightChevronIcon: Icon(Icons.chevron_right),
        ),

        // holidayPredicate: (day) {
        //   if (_events.containsKey(day)) return true;
        //   return false;
        // },
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.black),
          weekendStyle: TextStyle(color: Colors.black),
        ),

        onDaySelected: (selectedDay, focusedDay) {
          if (selectedDay.day > currentDay.day &&
              selectedDay.microsecondsSinceEpoch >
                  currentDay.microsecondsSinceEpoch) {
            // if
            print("hi");
          }
          ;
        },
        calendarStyle: CalendarStyle(
          holidayTextStyle: TextStyle(color: Colors.black),
          todayDecoration: BoxDecoration(
            color: Color.fromARGB(255, 130, 182, 231),
            shape: BoxShape.circle,
          ),
          outsideDaysVisible: false,
          weekendTextStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          weekendDecoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.red.shade100),
        ),

        // calendarBuilders: CalendarBuilders(
        //   holidayBuilder: (context, day, focusedDay) {
        //     if (_events.containsKey(day)) {
        //       if (_events[day] == "opted") {
        //         return Container(
        //           decoration:
        //               BoxDecoration(color: const Color.fromARGB(255, 111, 211, 114), shape: BoxShape.circle),
        //           width: 42,
        //           child: Center(
        //             child: Text("${day.day}"),
        //           ),
        //         );
        //       } else if (_events[day] == "not opted") {
        //         return Container(
        //           decoration:
        //               BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        //           width: 42,
        //           child: Center(
        //             child: Text("${day.day}"),
        //           ),
        //         );
        //       }
        //     }
        //   },
        // ),
      ),
    );
  }
}
