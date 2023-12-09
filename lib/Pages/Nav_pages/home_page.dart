import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vaterinarystore/Pages/Menu_Widgets/dentist_widget.dart';
import 'package:vaterinarystore/Pages/Menu_Widgets/grooming_widget.dart';
import 'package:vaterinarystore/Pages/Menu_Widgets/behavioral_widget.dart';
import 'package:vaterinarystore/Pages/Menu_Widgets/veterinary_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // DropDown String List
  final List<String> _locations = [
    'Choose  Location',
    'London,UK',
    'Lahore,Pk',
    'Mumbai,Ind',
    'Dhaka,Ban'
  ];

  // Dropdown default value
  String _selectedLocation = 'Choose  Location';

  // Menu Images URL List
  final List<String> menuImageURL = [
    'assets/images/list_menu/veterinary.png',
    'assets/images/list_menu/grooming.png',
    'assets/images/list_menu/behavioral.png',
    'assets/images/list_menu/dentist.png',
  ];

  // Menu Names List
  final List<String> menuNames = [
    "Veterinary",
    "Grooming",
    "Behavioral",
    "Dentistry",
  ];

  // Menu's Widgets
  static const List<Widget> menuPages = [
    VeterinaryWidget(),
    GroomingWidget(),
    BehavioralWidget(),
    DentistWidget(),
  ];

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menuImageURL.length,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 5,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                CircleAvatar(
                  backgroundColor: const Color(0xff22da6e),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/images/profile/pfp.jpg')),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Location',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.locationDot,
                    size: 30,
                    color: Colors.grey,
                  ),
                  DropdownButton(
                    alignment: Alignment.centerLeft,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    icon: const FaIcon(
                      FontAwesomeIcons.angleDown,
                      color: Colors.grey,
                    ),
                    underline: const SizedBox(),
                    iconSize: 18,
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation = newValue!;
                      });
                    },
                    items: _locations.map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 110,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: menuImageURL.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _current = index;
                                });
                              },
                              child: AnimatedContainer(
                                margin: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 5),
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    color: _current == index
                                        ? const Color(0xff22da6e)
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10)),
                                duration: const Duration(milliseconds: 300),
                                child: Center(
                                  child: Image.asset(
                                    menuImageURL[index],
                                    height: 25,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              menuNames[index],
                              style: GoogleFonts.poppins(
                                  color: _current == index
                                      ? const Color(0xff22da6e)
                                      : Colors.grey[600],
                                  fontSize: 12),
                            ),
                          ]);
                    }),
              ),
              Flexible(
                child: menuPages[_current],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
