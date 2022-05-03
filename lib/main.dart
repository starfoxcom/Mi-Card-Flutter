import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      title: 'starfoxcom',
      subtitle: 'Github',
      url: 'https://github.com/starfoxcom',
      fontAwesomeIcon: true,
      icon: FontAwesomeIcons.github,
    )
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _cardData2 = _cardData.asMap().entries.map((cardData) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 750),
          child: InkWell(
            onTap: () => launch(cardData.value.url),
            onHover: (value) {
              setState(() {
                cardData.value.onHover = value;
              });
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color:
                      cardData.value.onHover ? Colors.white70 : Colors.black87,
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
              child: ListTile(
                leading: cardData.value.fontAwesomeIcon
                    ? FaIcon(
                        cardData.value.icon,
                        color: cardData.value.onHover
                            ? Colors.black87
                            : Colors.white70,
                      )
                    : Icon(cardData.value.icon,
                        color: cardData.value.onHover
                            ? Colors.black87
                            : Colors.white70),
                title: Text(
                  cardData.value.title,
                  style: TextStyle(
                    color: cardData.value.onHover
                        ? Colors.black87
                        : Colors.white70,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(
                  cardData.value.subtitle,
                  style: TextStyle(
                    color: cardData.value.onHover
                        ? Colors.black45
                        : Colors.white30,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 15,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color:
                      cardData.value.onHover ? Colors.black87 : Colors.white70,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  ..._cardData2,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
