import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _characterName = '';

  void _findCharacter() {
    List<String> characters = [
      'Hello Kitty', 'My Melody', 'Kuromi', 'Pompompurin', 'Cinnamoroll',
      'Maru', 'Charmmy Kitty', 'Chibimaru', 'Chococat', 'Keroppi'
    ];
    final random = Random();
    setState(() {
      _characterName = characters[random.nextInt(characters.length)];
    });
  }

  void _launchURL() async {
    const url = 'https://www.youtube.com/watch?v=QNXvE1BZu8g';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Kitty Character Finder'),
        backgroundColor: const Color.fromARGB(255, 205, 168, 251),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/kuromi_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  filled: true,
                  fillColor: Color.fromARGB(219, 236, 172, 252),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _findCharacter,
                child: Text('Find My Character'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 195, 123, 239)),
                ),
              ),
              SizedBox(height: 20),
              if (_characterName.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(top: 20),
                  color: Colors.white.withOpacity(0.5),
                  child: Text(
                    'You are: $_characterName',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 90, 2, 117)),
                  ),
                ),
              if (_characterName.isNotEmpty)
                Image.asset(
                  'assets/${_characterName.toLowerCase().replaceAll(" ", "_")}.png',
                  fit: BoxFit.cover,
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _launchURL,
        label: Text('click aquí para una sorpresa'),
        icon: Icon(Icons.video_library),
        backgroundColor: const Color.fromARGB(255, 211, 110, 144),
      ),
    );
  }
}
