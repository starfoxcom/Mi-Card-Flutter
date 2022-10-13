import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timelines/timelines.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Card Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class CardData {
  String title;

  String subtitle;

  IconData icon;

  String url;

  bool fontAwesomeIcon;

  bool onHover;

  CardData({
    this.title = '',
    this.subtitle = '',
    this.icon = Icons.question_answer,
    this.url = '',
    this.fontAwesomeIcon = false,
    this.onHover = false,
  });
}

class TimelineCardData {
  String title;

  String subtitle;

  String date;

  IconData icon;

  bool fontAwesomeIcon;

  TimelineCardData({
    this.title = '',
    this.subtitle = '',
    this.date = '',
    this.icon = Icons.question_answer,
    this.fontAwesomeIcon = false,
  });
}

class _MyHomePageState extends State<MyHomePage> {
  final _cardData = [
    CardData(
      title: '+52 667 207 11 55',
      subtitle: 'Personal phone number',
      url: 'tel:+526672071155',
      icon: Icons.phone,
    ),
    CardData(
      title: 'alexzamudio_11@hotmail.com',
      subtitle: 'Personal mail',
      url: 'mailto:alexzamudio_11@hotmail.com',
      icon: Icons.mail,
    ),
    CardData(
      title: 'Jorge Zamudio',
      subtitle: 'LinkedIn',
      url: 'https://www.linkedin.com/in/alexzamudio/?locale=en_US',
      fontAwesomeIcon: true,
      icon: FontAwesomeIcons.linkedin,
    ),
    CardData(
      title: 'starfoxcom',
      subtitle: 'Github',
      url: 'https://github.com/starfoxcom',
      fontAwesomeIcon: true,
      icon: FontAwesomeIcons.github,
    ),
  ];

  final _timelineCardData = [
    TimelineCardData(
      title: 'Software Developer',
      subtitle: 'C&C Consulting Construction Group',
      date: 'August 2021 - November 2021',
      icon: Icons.work,
    ),
    TimelineCardData(
      title: 'Flutter Software Developer',
      subtitle: 'SmarTrader Inc.',
      date: 'November 2021 - Present',
      icon: Icons.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<Widget> contactCards = _cardData.asMap().entries.map((cardData) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: GestureDetector(
              onTap: () => launch(cardData.value.url),
              child: FocusableActionDetector(
                onShowHoverHighlight: (value) {
                  setState(() {
                    cardData.value.onHover = value;
                  });
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: cardData.value.onHover
                          ? Colors.white70
                          : Colors.black87,
                      boxShadow: [
                        BoxShadow(
                          color: cardData.value.onHover
                              ? Colors.black87
                              : Colors.white30,
                          spreadRadius: .5,
                          blurRadius: 0,
                          offset: const Offset(0, 1),
                        ),
                      ]),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(children: [
                      cardData.value.fontAwesomeIcon
                          ? Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: FaIcon(
                                cardData.value.icon,
                                color: cardData.value.onHover
                                    ? Colors.black87
                                    : Colors.white70,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(cardData.value.icon,
                                  color: cardData.value.onHover
                                      ? Colors.black87
                                      : Colors.white70),
                            ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardData.value.title,
                              style: TextStyle(
                                color: cardData.value.onHover
                                    ? Colors.black87
                                    : Colors.white70,
                                fontFamily: 'Source Sans Pro',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              cardData.value.subtitle,
                              style: TextStyle(
                                color: cardData.value.onHover
                                    ? Colors.black45
                                    : Colors.white30,
                                fontFamily: 'Source Sans Pro',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: cardData.value.onHover
                            ? Colors.black87
                            : Colors.white70,
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();

    final List<Widget> careerHistoryCards =
        _timelineCardData.asMap().entries.map((cardData) {
      return TimelineTile(
        node: TimelineNode.simple(
          color: Colors.white70,
          drawEndConnector: cardData.key != _timelineCardData.length - 1,
          indicatorChild: cardData.value.fontAwesomeIcon
              ? Padding(
                  padding: const EdgeInsets.all(5),
                  child: FaIcon(
                    cardData.value.icon,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    cardData.value.icon,
                  ),
                ),
        ),
        oppositeContents:
            //if cardData is even, else null
            cardData.key % 2 == 0
                ? ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 435),
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardData.value.title,
                              style: const TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              cardData.value.subtitle,
                              style: const TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 2.5),
                            Text(
                              cardData.value.date,
                              style: const TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 12,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : null,
        contents:
            //if cardData is odd, else null
            cardData.key % 2 != 0
                ? ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 435),
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardData.value.title,
                              style: const TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              cardData.value.subtitle,
                              style: const TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 15,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(height: 2.5),
                            Text(
                              cardData.value.date,
                              style: const TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 12,
                                color: Colors.white30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : null,
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  const CircleAvatar(
                    radius: 50,
                    foregroundImage: AssetImage('images/perfil 1a1.jpeg'),
                  ),
                  const Text(
                    'Jorge Zamudio',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  const Text(
                    'FLUTTER DEVELOPER',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                      color: Colors.white70,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  const SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.white70,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (size.width > 1550) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: contactCards,
                        );
                      } else {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: contactCards,
                        );
                      }
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  const Text(
                    'CAREER HISTORY',
                    style: TextStyle(
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20,
                      color: Colors.white70,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  const SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.white70,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  ...careerHistoryCards,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
