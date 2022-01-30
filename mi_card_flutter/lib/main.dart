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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Center(
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
                GestureDetector(
                  onTap: () => launch('tel:+526672071155'),
                  child: const Card(
                    shadowColor: Colors.white70,
                    color: Colors.black87,
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.white70,
                      ),
                      title: Text(
                        '+52 667 207 11 55',
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        'Personal phone number',
                        style: TextStyle(
                          color: Colors.white30,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 15,
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => launch('mailto:alexzamudio_11@hotmail.com'),
                  child: const Card(
                    shadowColor: Colors.white70,
                    color: Colors.black87,
                    child: ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.white70,
                      ),
                      title: Text(
                        'alexzamudio_11@hotmail.com',
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        'Personal mail',
                        style: TextStyle(
                          color: Colors.white30,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 15,
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => launch('https://github.com/starfoxcom'),
                  child: const Card(
                    shadowColor: Colors.white70,
                    color: Colors.black87,
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.github,
                        color: Colors.white70,
                      ),
                      title: Text(
                        'starfoxcom',
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        'Github',
                        style: TextStyle(
                          color: Colors.white30,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 15,
                        ),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
