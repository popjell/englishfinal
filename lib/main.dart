import 'dart:html';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:mailer/mailer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'main.dart';
import 'secondroute.dart';
import 'thirdroute.dart';
import 'fourthroute.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colonization in Canada',
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color.fromARGB(255, 202, 108, 0)),
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 21, 43),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List text = [
    //body paragraphs
    "\n\n\n\nColonialism in Canada has had a devastating impact on Indigenous peoples and their culture. The process of colonization began with the arrival of European explorers in the 16th century and has continued to this day. From the 16th century to today, the Canadian government has continued to oppress First Nations, and has not put a significant effort into reconciliation. The Indian act of 1876, and the residential schools that ran in Canada from the 1880s to 1976 both stripped Indigenous peoples of their rights and their traditions. The displacement of First Nations by the Canadian government also caused many First nations groups to suffer due to a lack of resources.",
    "\n     The Indian Act of 1876 was a piece of legislation enacted to assimilate First nations into Canada, and force them to give up their way of life. This act enabled the government to have complete control over Indigenous people's lives, including being able to use their land and kick them off at will, use their resources, and take their children. The Indian Residential Schools system, which were in operation from the 1880s to 1996, forcibly removed Indigenous children from their families and subjected them to abuse, neglect and cultural genocide. Most children who attended these residential schools never made it home, and either died due to the abuse suffered at the residential schools, or were forced to give up their traditions, language, and culture. The residential schools attempted to “take the Indian out of the child”, in the words of former Prime minister John A. Macdonald. Indigenous childrens were forced to convert to Christianity and change their name to an English one. They were also not allowed to speak their own language. The trauma caused by residential schools continues to be felt in Indigenous communities today, with high rates of poverty, addiction, and suicide.",
    "\n     Indigenous peoples in Canada continue to face a number of challenges and issues as a result of the ongoing impacts of colonialism. One of the most pressing issues is the ongoing loss of land and resources, which has led to the forced displacement of Indigenous peoples from their traditional territories and has had a profound impact on their livelihoods and ways of life. Many Indigenous peoples living on reserve lands continue to experience poverty and poor living conditions due to the scarcity of resources. First nations are also unfairly represented in the criminal justice system, and often recieve harsher prison sentences. Indigenous peoples also face challenges in terms of access to quality education, healthcare, and housing. First nations youth also struggle more with mental health, and have a much higher rate of suicide than the average Canadian teenager, as they often are unable to receive the support they need. Additionally, Indigenous women and girls face high rates of violence and disappearances. The government of Canada has a responsibility to take steps to address these ongoing issues and support the self-determination of Indigenous peoples.",
    "\nThe Canadian government must take immediate action to address the ongoing impacts of colonialism on First Nations communities. This includes implementing a comprehensive reparations program, increasing funding for Indigenous-led initiatives and programs, returning stolen land to Indigenous communities, addressing the over-representation of Indigenous peoples in the criminal justice system, increasing funding for Indigenous-led environmental protection and conservation programs, addressing the high rates of violence and disappearances of Indigenous women and girls, recognizing and respecting the sovereignty of Indigenous nations and peoples, and consulting with Indigenous leaders and communities to address their specific needs.\n\n",
  ];
  TextEditingController _firstnamecontroller = TextEditingController();
  TextEditingController _lastnamecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late String displaytext;
  late int signs;
  bool signed = false;
  late DocumentSnapshot snapshot;
  void _sendEmail(String fname, String lname, String email) async {
    var doc =
        await FirebaseFirestore.instance.collection('signs').doc('signature');
    doc.update(
      {
        'count': FieldValue.increment(1),
      },
    );
    doc.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        signs = data['count'];
        // ...
      },
      onError: (e) => print("Error getting document: $e"),
    );
    setState(() {
      signed = true;
    });
  }

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
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FourthRoute()),
                          );
                        },
                        child: const Text(
                          'About me',
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //body paragraphs
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Text(
                  text[0],
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: Text(
                          text[1],
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Image(
                      image: AssetImage('eventphotos/UnitedChurch_432.jpg'),
                      width: MediaQuery.of(context).size.width / 2,
                      height: 500,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                    child: Image(
                      image: AssetImage('eventphotos/boil-water-adv1.png'),
                      width: (MediaQuery.of(context).size.width / 2) - 40,
                      height: 500,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: Text(
                          text[2],
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Text(
                  text[3],
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.openSans(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 0, 21, 43),
                      Color.fromARGB(255, 202, 108, 0),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                color: Color.fromARGB(255, 202, 108, 0),
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                        child: Text(
                          signed
                              ? "Thank you for signing!"
                              : "Sign the Petition",
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('signs')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.hasError) {
                              print(streamSnapshot.error);
                              return Text("Error");
                            } else {
                              switch (streamSnapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Text("Loading");
                                default:
                                  return Text(
                                    "${streamSnapshot.data?.docs[0]['count']} people have signed! ${5000 - streamSnapshot.data?.docs[0]['count']} more until we reach our goal!",
                                    style: GoogleFonts.nunito(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  );
                              }
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('signs')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            return LinearProgressIndicator(
                              value:
                                  (streamSnapshot.data?.docs[0]['count'] ?? 0) /
                                      5000,
                              color: Color.fromARGB(255, 177, 0, 0),
                              backgroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                            );
                          },
                        ),
                      ),
                      signed
                          ? Text("")
                          : Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          child: TextFormField(
                                            controller: _firstnamecontroller,
                                            validator: (value) => value!.isEmpty
                                                ? 'Please enter your first name'
                                                : null,
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              hintText: 'First Name',
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                            ),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          child: TextFormField(
                                            validator: ((value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your last name';
                                              }
                                            }),
                                            controller: _lastnamecontroller,
                                            decoration: const InputDecoration(
                                              fillColor: Colors.white,
                                              hintText: 'Last Name',
                                              hintStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                            ),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: TextFormField(
                                        controller: _emailcontroller,
                                        validator: (value) {
                                          bool emailValid = RegExp(
                                                  r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value!);
                                          if (!emailValid) {
                                            return 'Please enter a valid email';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                        ),
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();
                                            _sendEmail(
                                                _firstnamecontroller.text,
                                                _lastnamecontroller.text,
                                                _emailcontroller.text);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: const Color.fromARGB(
                                              255, 0, 21, 43),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                        ),
                                        child: const Text(
                                          'Sign',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
