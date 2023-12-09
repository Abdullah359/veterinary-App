import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorsListTile extends StatelessWidget {
  const DoctorsListTile(
      {super.key,
      required this.imageURL,
      required this.name,
      required this.starRating, required this.speciality});
  final String imageURL, name, starRating, speciality;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 60,
        width: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageURL,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        speciality,
        style: GoogleFonts.poppins(),
      ),
      trailing: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              FontAwesomeIcons.solidStar,
              size: 11,
              color: Color(0xff22da6e),
            ),
            const SizedBox(
              width: 3,
            ),
            Text(
              starRating,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            )
          ]),
    );
  }
}
