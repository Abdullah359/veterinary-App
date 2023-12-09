import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Lottie.asset('assets/lottie/logs.json', repeat: false),
                Text(
                  'No logs available',
                  style: GoogleFonts.poppins(),
                ),
              ]),
        ),
      ),
    );
  }
}
