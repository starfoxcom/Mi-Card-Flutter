import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  String companyPosition;

  String companyName;

  String? roleDescription;

  DateTime startDate;

  DateTime? endDate;

  IconData icon;

  bool fontAwesomeIcon;

  bool isVisible;

  bool onHover;

  TimelineCardData({
    this.companyPosition = '',
    this.companyName = '',
    this.roleDescription,
    required this.startDate,
    this.endDate,
    this.icon = Icons.question_answer,
    this.fontAwesomeIcon = false,
    this.isVisible = true,
    this.onHover = false,
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
      companyPosition: 'Advanced App Engineering Sr Analyst',
      companyName: 'Accenture México',
      roleDescription: '- Design software solutions to address specific '
          'business requirements.\n'
          '- Develop system specifications and interfaces for complex '
          'components.\n'
          '- Gather and interpret user and system requirements.\n'
          '- Lead application design delivery and communicate the vision to '
          'application development teams.\n'
          '- Develop and implement test plans.',
      startDate: DateTime(2023, 01),
      icon: Icons.work,
      isVisible: false,
    ),
    TimelineCardData(
      companyPosition: 'Flutter Software Developer',
      companyName: 'SmarTrader Inc.',
      roleDescription: '- Developed multi platform applications through '
          'Flutter Framework with BLoC state management, '
          'tests and their corresponding code coverage.\n'
          '- Consulted with engineering team members to '
          'determine system loads and develop improvement '
          'plans.\n'
          '- Tested programs and databases to identify issues '
          'and make necessary modifications.',
      startDate: DateTime(2021, 11),
      icon: Icons.work,
      isVisible: false,
    ),
    TimelineCardData(
      companyPosition: 'Software Developer',
      companyName: 'C&C Consulting Construction Group',
      roleDescription: '- Delivered solutions for management systems to '
          'provide detailed digital recordkeeping capability.\n'
          '- Evaluated project requirements and specifications '
          'and developed software applications in '
          'accordance to them.',
      startDate: DateTime(2021, 08),
      endDate: DateTime(2021, 11),
      icon: Icons.work,
      isVisible: false,
    ),
    TimelineCardData(
      companyPosition: 'Flutter Software Developer',
      companyName: 'Green Oceans Inc.',
      roleDescription: '- Conducted research, gathered information from '
          'multiple sources and presented results to implement Flutter framework '
          'as development environment of choice for future projects.\n'
          '- Learned new skills and applied to daily tasks to improve efficiency '
          'and productivity with Flutter framework.\n'
          '- Increased customer satisfaction by resolving issues.\n'
          '- Used coordination and planning skills to achieve results '
          'according to schedule.',
      startDate: DateTime(2021, 01),
      endDate: DateTime(2021, 08),
      icon: Icons.work,
      isVisible: false,
    ),
  ];

  final flipController = FlipCardController();

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
              onTap: () => launchUrl(Uri.parse(cardData.value.url)),
              child: FocusableActionDetector(
                mouseCursor: SystemMouseCursors.click,
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
                  duration: const Duration(milliseconds: 250),
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
                                fontFamily: 'SourceSansPro',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              cardData.value.subtitle,
                              style: TextStyle(
                                color: cardData.value.onHover
                                    ? Colors.black45
                                    : Colors.white30,
                                fontFamily: 'SourceSansPro',
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
      return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 750),
        child: Column(
          children: [
            VisibilityDetector(
              key: Key(
                cardData.key.toString(),
              ),
              onVisibilityChanged: (info) {
                if (info.visibleFraction >= .2) {
                  setState(() {
                    cardData.value.isVisible = true;
                  });
                }
                // else {
                //   setState(() {
                //     cardData.value.isVisible = false;
                //   });
                // }
              },
              child: AnimatedOpacity(
                opacity: cardData.value.isVisible ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: TimelineTile(
                  indicatorStyle: IndicatorStyle(
                    width: 30,
                    height: 30,
                    indicator: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: cardData.value.fontAwesomeIcon
                          ? FaIcon(
                              cardData.value.icon,
                            )
                          : Icon(
                              cardData.value.icon,
                            ),
                    ),
                  ),
                  isFirst: cardData.key == 0,
                  isLast: cardData.key == _timelineCardData.length - 1,
                  alignment: TimelineAlign.manual,
                  lineXY: cardData.key % 2 == 0 ? .9 : .1,
                  startChild: //if cardData is even, else null
                      cardData.key % 2 == 0
                          ? FlipCard(
                              controller: flipController,
                              onTapFlipping:
                                  cardData.value.roleDescription != null,
                              rotateSide: RotateSide.left,
                              frontWidget: FocusableActionDetector(
                                onShowHoverHighlight: (value) {
                                  setState(() {
                                    cardData.value.onHover = value;
                                  });
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.value.companyPosition,
                                                style: const TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                cardData.value.companyName,
                                                style: const TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 15,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                              const SizedBox(height: 2.5),
                                              Text(
                                                cardData.value.endDate != null
                                                    ? '${DateFormat('MMMM yyyy').format(cardData.value.startDate)} - ${DateFormat('MMMM yyyy').format(cardData.value.endDate!)}'
                                                    : '${DateFormat('MMMM yyyy').format(cardData.value.startDate)} - Present',
                                                style: const TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 12,
                                                  color: Colors.white30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (cardData.value.roleDescription !=
                                            null)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: AnimatedOpacity(
                                              opacity: size.width > 1550
                                                  ? cardData.value.onHover
                                                      ? 1
                                                      : 0
                                                  : 1,
                                              duration: const Duration(
                                                  milliseconds: 250),
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.flip_to_back,
                                                    color: Colors.white30,
                                                  ),
                                                  Text(
                                                    'Tap for\ndescription',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SourceSansPro',
                                                      fontSize: 12,
                                                      color: Colors.white30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              backWidget: FocusableActionDetector(
                                onShowHoverHighlight: (value) {
                                  setState(() {
                                    cardData.value.onHover = value;
                                  });
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.value
                                                        .roleDescription ??
                                                    'No description provided',
                                                textAlign: TextAlign.justify,
                                                style: const TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 15,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: AnimatedOpacity(
                                            opacity: size.width > 1550
                                                ? cardData.value.onHover
                                                    ? 1
                                                    : 0
                                                : 1,
                                            duration: const Duration(
                                                milliseconds: 250),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.flip_to_front,
                                                  color: Colors.white30,
                                                ),
                                                Text(
                                                  'Tap for\nposition',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'SourceSansPro',
                                                    fontSize: 12,
                                                    color: Colors.white30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : null,
                  endChild: //if cardData is odd, else null
                      cardData.key % 2 != 0
                          ? FlipCard(
                              controller: flipController,
                              onTapFlipping:
                                  cardData.value.roleDescription != null,
                              rotateSide: RotateSide.right,
                              frontWidget: FocusableActionDetector(
                                onShowHoverHighlight: (value) {
                                  setState(() {
                                    cardData.value.onHover = value;
                                  });
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.value.companyPosition,
                                                style: const TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                cardData.value.companyName,
                                                style: const TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 15,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                              const SizedBox(height: 2.5),
                                              Text(
                                                cardData.value.endDate != null
                                                    ? '${DateFormat('MMMM yyyy').format(cardData.value.startDate)} - ${DateFormat('MMMM yyyy').format(cardData.value.endDate!)}'
                                                    : '${DateFormat('MMMM yyyy').format(cardData.value.startDate)} - Present',
                                                style: const TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 12,
                                                  color: Colors.white30,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (cardData.value.roleDescription !=
                                            null)
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: AnimatedOpacity(
                                              opacity: size.width > 1550
                                                  ? cardData.value.onHover
                                                      ? 1
                                                      : 0
                                                  : 1,
                                              duration: const Duration(
                                                  milliseconds: 250),
                                              child: const Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.flip_to_back,
                                                    color: Colors.white30,
                                                  ),
                                                  Text(
                                                    'Tap for\ndescription',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SourceSansPro',
                                                      fontSize: 12,
                                                      color: Colors.white30,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              backWidget: FocusableActionDetector(
                                onShowHoverHighlight: (value) {
                                  setState(() {
                                    cardData.value.onHover = value;
                                  });
                                },
                                child: Card(
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                cardData.value
                                                        .roleDescription ??
                                                    'No description provided',
                                                textAlign: TextAlign.justify,
                                                style: const TextStyle(
                                                  fontFamily: 'SourceSansPro',
                                                  fontSize: 15,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: AnimatedOpacity(
                                            opacity: size.width > 1550
                                                ? cardData.value.onHover
                                                    ? 1
                                                    : 0
                                                : 1,
                                            duration: const Duration(
                                                milliseconds: 250),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.flip_to_front,
                                                  color: Colors.white30,
                                                ),
                                                Text(
                                                  'Tap for\nposition',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: 'SourceSansPro',
                                                    fontSize: 12,
                                                    color: Colors.white30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : null,
                ),
              ),
            ),
            if (cardData.key != _timelineCardData.length - 1)
              AnimatedOpacity(
                  opacity: cardData.value.isVisible ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: const TimelineDivider(
                    begin: .1,
                    end: .9,
                    thickness: 4,
                  ))
          ],
        ),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  const SizedBox(height: 20),
                  const Text(
                    'FLUTTER DEVELOPER',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.white70,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),
                  const Text(
                    'CAREER HISTORY',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.white70,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...careerHistoryCards,
                  const SizedBox(height: 10),
                  const SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Made with ❤ with Flutter',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 12,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
