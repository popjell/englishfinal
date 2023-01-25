import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';
import 'thirdroute.dart';

class FourthRoute extends StatefulWidget {
  const FourthRoute({super.key});

  @override
  State<FourthRoute> createState() => _FourthRouteState();
}

class _FourthRouteState extends State<FourthRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            'Decolonize Canada',
            style: GoogleFonts.kanit(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 40,
            ),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()),
                          );
                        },
                        child: const Text(
                          'Our Mission',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ThirdRoute()),
                          );
                        },
                        child: const Text(
                          'History of Colonization in canada',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
          child: Text(
            'This website was made to increase awareness about the issues that indigenous people face, and gain signatures for my petition. The reason I made this website was because of a book I read in my English class, called Indian horse, by Richard Wagamese. This book detailed the life of Saul Indian Horse, a young indigenous boy who gets taken from his family and gets placed into a residential school. Saul experiences physical, emotional, cultural, and sexual abuse at the residential school. Saul discoveres a passion for hockey, and distracts himself from his trauma through play. However, Saul also faces a lot of racism and discrimination when in the hockey scene. The trauma that Saul and his classmates face throught the book were a direct result of colonialism in Canada. This book opened my eyes to the horrors of the residential school system. This was furthered when we watched the movie version of Indian horse, which showed the experiences of Saul and his class mates in the Residential school system in more depth. After reading this book, I decided to do research on Colonialism and Indigenous issues in Canada, as part of my final project for my english class. I learned that despite the fact that residential schools closed in 1996, Indigenous people still feel the effects of colonialism in Canada, which motivated me to create this petition.',
            textAlign: TextAlign.justify,
            style: GoogleFonts.roboto(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
