import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allan Lenkaa\'s Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
      ),
      home: Center(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Function to launch URLs
  void _launchURL(String url) async {
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
        title: Text('Allan Lenkaa\'s Portfolio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1522252234503-e356532cafd5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZGV2ZWxvcGVyfGVufDB8fDB8fHww'    ),
              ),
              SizedBox(height: 16),
              Text(
                'Allan Lenkaa Ngochila',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Professional Software Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'My name is Allan Lenkaa Ngochila. I am a professional software developer with 3 years of coding experience. Powerlearn project has been a good working platform as we get a chance of impacting many youths in Africa.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _launchURL('https://github.com/Lenkaa3792?tab=repositories');
                },
                child: Text('View Projects'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 32),
              SkillsSection(),
              SizedBox(height: 32),
              ContactButtons(_launchURL),
              SizedBox(height: 32),
              ExperienceSection(),
              SizedBox(height: 32),
              EducationSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Skills',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        // Add your skills as chips or any other format
        Wrap(
          spacing: 8,
          children: [
            Chip(label: Text('Flutter')),
            Chip(label: Text('Dart')),
            Chip(label: Text('UI/UX Design')),
            // Add more skills as needed
          ],
        ),
      ],
    );
  }
}

class ContactButtons extends StatelessWidget {
  final Function(String) launchURL;

  ContactButtons(this.launchURL);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            launchURL('mailto:allanlenkaa@gmail.com');
          },
          icon: Icon(Icons.email),
          label: Text('Email Me'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            launchURL('tel:+0797790312');
          },
          icon: Icon(Icons.phone),
          label: Text('Call Me'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            launchURL('https://www.linkedin.com/in/allan-lenkaa-9103b918a/');
          },
          icon: Icon(Icons.people),
          label: Text('Connect on LinkedIn'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Experience',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'DART Module Lead - Working with a great team to give our students the best we can. The experience has been good, and we look forward to achieving the organization\'s goal of training 1 million developers.',
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 16),
        Text(
          'Database Administrator - Developed a helpdesk system for the company.',
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}

class EducationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Bachelor of Science in Computer Technology - Multimedia University of Kenya.',
          textAlign: TextAlign.start,
        ),
        Text(
          'Fullstack Software Development - Moringa School.',
          textAlign: TextAlign.start,
        ),
        Text(
          'Oracle Low Code - Oracle University.',
          textAlign: TextAlign.start,
        ),
        Text(
          'Mobile Software Development - Emobilis Institute.',
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
