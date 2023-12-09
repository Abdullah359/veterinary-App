import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaterinarystore/Components/doctors_listtile.dart';
import '../appointment/appointment_page.dart';

class GroomingWidget extends StatefulWidget {
  const GroomingWidget({
    super.key,
  });

  @override
  State<GroomingWidget> createState() => _GroomingWidgetState();
}

class _GroomingWidgetState extends State<GroomingWidget> {
  // Veterinary Doctors Image URL
  final List<String> vetDocsImageURL = [
    'assets/images/doctors/female_doc.jpg',
    'assets/images/doctors/male_doc.jpg',
  ];

  // Veterinary Doctors Name
  final List<String> vetDocNames = [
    'Dr. Anna Johnson',
    'Dr. Shakti Maan',
  ];

  // Veterinary Doctors Speciality
  final List<String> vetDocSpeciality = [
    'Grooming Specialist',
    'Grooming Specialist',
  ];

  // Veterinary Doctors Star-Rating
  final List<String> vetDocRating = [
    '5.0',
    '4.8',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Best specialist nearby',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: vetDocNames.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300]),
                  child: Center(
                    child: DoctorsListTile(
                      imageURL: vetDocsImageURL[index],
                      name: vetDocNames[index],
                      starRating: vetDocRating[index],
                      speciality: vetDocSpeciality[index],
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          'Upcoming appointments',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(15),
          dashPattern: const [10, 10],
          color: const Color(0xff22da6e),
          strokeWidth: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AppointmentPage()),
              );
            },
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.circlePlus,
                    color: Color(0xff22da6e),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Book an appointment',
                    style: GoogleFonts.poppins(color: Colors.grey),
                  )
                ],
              )),
            ),
          ),
        ),
      ]),
    );
  }
}
