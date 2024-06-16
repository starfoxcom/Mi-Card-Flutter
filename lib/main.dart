import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_card_flutter/career_timeline/career_timeline.dart';
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

class ContactData {
  String title;

  String subtitle;

  IconData icon;

  String url;

  bool fontAwesomeIcon;

  bool onHover;

  ContactData({
    this.title = '',
    this.subtitle = '',
    this.icon = Icons.question_answer,
    this.url = '',
    this.fontAwesomeIcon = false,
    this.onHover = false,
  });
}

class _MyHomePageState extends State<MyHomePage> {
  final contactData = [
    ContactData(
      title: 'alexzamudio_11@hotmail.com',
      subtitle: 'Personal mail',
      url: 'mailto:alexzamudio_11@hotmail.com',
      icon: Icons.mail,
    ),
    ContactData(
      title: 'Jorge Zamudio',
      subtitle: 'LinkedIn',
      url: 'https://www.linkedin.com/in/alexzamudio/?locale=en_US',
      fontAwesomeIcon: true,
      icon: FontAwesomeIcons.linkedin,
    ),
    ContactData(
      title: 'starfoxcom',
      subtitle: 'Github',
      url: 'https://github.com/starfoxcom',
      fontAwesomeIcon: true,
      icon: FontAwesomeIcons.github,
    ),
  ];

  final careerTimelineData = [
    CareerTimelineData(
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
    CareerTimelineData(
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
      endDate: DateTime(2023, 01),
      icon: Icons.work,
      isVisible: false,
    ),
    CareerTimelineData(
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
    CareerTimelineData(
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final List<Widget> contactCards =
        contactData.asMap().entries.map((contactCardData) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: GestureDetector(
              onTap: () => launchUrl(Uri.parse(contactCardData.value.url)),
              child: FocusableActionDetector(
                mouseCursor: SystemMouseCursors.click,
                onShowHoverHighlight: (value) {
                  setState(() {
                    contactCardData.value.onHover = value;
                  });
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: contactCardData.value.onHover
                          ? Colors.white70
                          : Colors.black87,
                      boxShadow: [
                        BoxShadow(
                          color: contactCardData.value.onHover
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
                      contactCardData.value.fontAwesomeIcon
                          ? Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: FaIcon(
                                contactCardData.value.icon,
                                color: contactCardData.value.onHover
                                    ? Colors.black87
                                    : Colors.white70,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(contactCardData.value.icon,
                                  color: contactCardData.value.onHover
                                      ? Colors.black87
                                      : Colors.white70),
                            ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contactCardData.value.title,
                              style: TextStyle(
                                color: contactCardData.value.onHover
                                    ? Colors.black87
                                    : Colors.white70,
                                fontFamily: 'SourceSansPro',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              contactCardData.value.subtitle,
                              style: TextStyle(
                                color: contactCardData.value.onHover
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
                        color: contactCardData.value.onHover
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
                  ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 750),
                      child: CareerTimelineListView(careerTimelineData)),
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
