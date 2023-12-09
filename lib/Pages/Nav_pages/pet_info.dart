import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PetInfoPage extends StatelessWidget {
  const PetInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            Lottie.asset('assets/lottie/pet_info.json', repeat: false),
            Text(
              'No data found',
              style: GoogleFonts.poppins(),
            ),
          ]),
        ),
      ),
    );
  }
}
