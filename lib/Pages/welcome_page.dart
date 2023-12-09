import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaterinarystore/Components/bottom_nav_bar.dart';
import '../main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  static List<Widget> kWidget = <Widget>[
    WelcomeDisplayWidget(
      introText: 'Find Recommended Specialist in Area',
      centerWidget: Container(
        alignment: Alignment.center,
        height: 250,
        width: double.infinity,
        child: Lottie.asset(
          'assets/lottie/vet_pet.json',
        ),
      ),
      endWidget: const SizedBox(),
    ),
    WelcomeDisplayWidget(
      introText: 'Lets Consult the Best Doctors for Pets',
      centerWidget: Container(
        alignment: Alignment.center,
        height: 260,
        width: double.infinity,
        child: Image.asset(
          'assets/images/docs.png',
          fit: BoxFit.cover,
        ),
      ),
      endWidget: const SizedBox(),
    ),
    WelcomeDisplayWidget(
      introText: 'Find Vet for Your Pet & Make Appointment',
      centerWidget: CircleAvatar(
        backgroundColor: const Color(0xff22db8e),
        radius: 100,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Image.asset(
            'assets/images/steth.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      endWidget: GestureDetector(
        onTap: () {
          Navigator.pushAndRemoveUntil(
              GlobalContextService.navigatorKey.currentContext!,
              MaterialPageRoute(
                  builder: (BuildContext context) => const MyBottomNavBar()),
              (route) => false);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: const Color(0xff22da6e),
          ),
          child: Center(
            child: Text(
              'Get Started',
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: WelcomePage.kWidget.length,
      // Use a Builder here, otherwise 'DefaultTabController.of(context)' below
      // will return null
      child: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              final TabController controller = DefaultTabController.of(context);
              !controller.indexIsChanging
                  ? controller.animateTo(WelcomePage.kWidget.length - 1)
                  : null;
            },
            backgroundColor: const Color(0xff22da6e),
            label: Text(
              'Skip',
              style: GoogleFonts.poppins(fontSize: 15),
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(children: <Widget>[
              Expanded(
                child: TabBarView(
                  children: WelcomePage.kWidget,
                ),
              ),
              const TabPageSelector(
                color: Colors.grey,
                borderStyle: BorderStyle.none,
                selectedColor: Color(0xff22da6e),
              ),
            ]),
          ),
        );
      }),
    );
  }
}

class WelcomeDisplayWidget extends StatelessWidget {
  const WelcomeDisplayWidget({
    super.key,
    required this.introText,
    required this.centerWidget,
    required this.endWidget,
  });
  final String introText;
  final Widget centerWidget;
  final Widget endWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(children: [
        SizedBox(
          height: 80,
        ),
        Text(introText,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center),
        SizedBox(
          height: 50,
        ),
        centerWidget,
        SizedBox(
          height: 50,
        ),
        endWidget,
      ]),
    );
  }
}
