import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

import 'main.dart';
import 'fourthroute.dart';

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({super.key});

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class Event {
  String description;
  String date;
  bool image;
  Event(this.description, this.date, this.image);
}

class _ThirdRouteState extends State<ThirdRoute> {
  List events = <Event>[
    Event(
      "French explorer Jacques Cartier claimed Canada for France, beginning the process of European colonization.",
      "1534",
      true,
    ),
    Event(
      "The fur trade between the First Nations and European settelers begins and ends, causing the First nations to become reliant on the European settlers.",
      "1600s-1701",
      true,
    ),
    Event(
      "Treaty of Paris ends the Seven Years' War, with Britain gaining control of all French territory in Canada and leading to further colonization and displacement of Indigenous peoples.",
      "1763",
      true,
    ),
    Event(
      "The Indian Act is passed, which grants the Canadian government control over Indigenous peoples and their lands, leading to the forced removal of Indigenous children from their families to attend residential schools.",
      "1876",
      true,
    ),
    Event(
      "Residential schools, run by churches and funded by the government, operate in Canada, with the goal of assimilation Indigenous children into European-Canadian society. Many children suffer abuse and neglect, and thousands never return home.",
      "1880s-1996",
      true,
    ),
    Event(
      "Canada patriates its constitution, including the Charter of Rights and Freedoms. This includes section 35 which recognizes and affirms the existing aboriginal and treaty rights of the Indigenous peoples of Canada.",
      "1982",
      true,
    ),
    Event(
      "A 78-day standoff between Mohawk people and the Canadian government over the proposed expansion of a golf course into Mowhawk land occurs. The standoff eventually ended after the military was called in, and the golf course expansion was cancelled. The Canadian government purchased the land, but they never established it as a reserve. This would come to be known as the Oka crisis",
      "1990",
      true,
    ),
    Event(
      "The Royal Commission on Aboriginal Peoples releases its final report, which includes recommendations for the reconciliation of Indigenous and non-Indigenous peoples in Canada.",
      "1996",
      false,
    ),
    Event(
      "The Truth and Reconciliation Commission releases its final report, which includes 94 calls to action for the Canadian government to address the legacy of residential schools and improve the lives of Indigenous peoples in Canada",
      "2015",
      true,
    ),
    Event(
      "The government passes the Indigenous Languages Act to recognize and support the revitalization of Indigenous languages in Canada.",
      "2018",
      false,
    ),
    Event(
      "As of 2023, only 14 of the 94 calls to action from the Truth and Reconciliation Commission have been fully implemented.",
      "2023",
      false,
    ),
  ];
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
          preferredSize: const Size.fromHeight(50),
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            return TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.01,
              isFirst: index == 0,
              isLast: index == events.length - 1,
              indicatorStyle: const IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicatorXY: 0.1,
                  padding: EdgeInsets.symmetric(vertical: 16.0)),
              endChild: Container(
                constraints: const BoxConstraints(minHeight: 100),
                child: Card(
                  color: Color.fromARGB(255, 46, 46, 46),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: events[index].image
                          ? <Widget>[
                              Text(
                                events[index].description,
                                style: GoogleFonts.kanit(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                events[index].date,
                                style: GoogleFonts.kanit(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Image(
                                image: AssetImage(
                                  'eventphotos/${index + 1}.jpg',
                                ),
                                height: 200,
                                width: 200,
                              ),
                            ]
                          : <Widget>[
                              Text(
                                events[index].description,
                                style: GoogleFonts.kanit(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                events[index].date,
                                style: GoogleFonts.kanit(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
