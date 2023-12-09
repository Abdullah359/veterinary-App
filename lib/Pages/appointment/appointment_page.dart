import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  // Present Time
  DateTime today = DateTime.now();
  void _selectedDay(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  // Time Slots Cell index
  int current = 0;

  // Available Time Slots List
  final List<String> timeSlots = [
    '08:00',
    '10:30',
    '16:30',
  ];
  // Appointed Date Func
  void _dateAppointed() {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Your Appointment Booked Successfully.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
        );
      },
    );
  }

  // Not Appointed Date Func
  void _dateNotAppointed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            "Please Select Correct Date or only Current Month/Year.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
        );
      },
    );
  }

  var currentYear =
      int.parse(DateTime.timestamp().toString().split(" ")[0].split("-")[0]);
  var currentMonth =
      int.parse(DateTime.timestamp().toString().split(" ")[0].split("-")[1]);
  var currentDate =
      int.parse(DateTime.timestamp().toString().split(" ")[0].split("-")[2]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: FaIcon(
                    FontAwesomeIcons.angleLeft,
                    size: 15,
                  ),
                ),
              ),
              Text(
                'Book an appointment',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TableCalendar(
                  locale: 'en_US',
                  rowHeight: 50,
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle:
                        GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  daysOfWeekVisible: true,
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  calendarStyle: CalendarStyle(
                    isTodayHighlighted: true,
                    selectedDecoration: const BoxDecoration(
                      color: Color(0xff22da8f),
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: GoogleFonts.poppins(color: Colors.white),
                    todayDecoration: const BoxDecoration(
                      color: Color(0xff22da8f),
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: GoogleFonts.poppins(),
                    defaultTextStyle: GoogleFonts.poppins(),
                  ),
                  focusedDay: today,
                  firstDay: DateTime.utc(2023, 11, 01),
                  lastDay: DateTime.utc(2030, 12, 31),
                  onDaySelected: _selectedDay,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: timeSlots.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          margin: const EdgeInsets.all(20),
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: current == index
                                  ? const Color(0xff22da6e)
                                  : Colors.grey[300]),
                          duration: const Duration(milliseconds: 250),
                          child: Center(
                            child: Text(
                              timeSlots[index],
                              style: GoogleFonts.poppins(
                                  color: current == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              GestureDetector(
                onTap: () {
                  var focusedYear =
                      int.parse(today.toString().split(" ")[0].split("-")[0]);
                  var focusedMonth =
                      int.parse(today.toString().split(" ")[0].split("-")[1]);
                  var focusedDate =
                      int.parse(today.toString().split(" ")[0].split("-")[2]);

                  if (currentDate <= focusedDate &&
                      currentYear >= focusedYear &&
                      currentMonth >= focusedMonth) {
                    _dateAppointed();
                  } else {
                    _dateNotAppointed();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color(0xff22da6e),
                  ),
                  child: Center(
                    child: Text(
                      'Book Now',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
