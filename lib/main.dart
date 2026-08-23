import 'package:flutter/material.dart';

void main() => runApp(EIClassesApp());

class EIClassesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EI CLASSES - DEEPANSH AI PRO',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> features = [
    {"name": "AI Doubt Solver", "icon": Icons.lightbulb, "color": Colors.orange},
    {"name": "Image to Answer", "icon": Icons.camera_alt, "color": Colors.blue},
    {"name": "Voice AI Chat", "icon": Icons.mic, "color": Colors.red},
    {"name": "PDF Notes Maker", "icon": Icons.picture_as_pdf, "color": Colors.green},
    {"name": "Exam Mode", "icon": Icons.quiz, "color": Colors.purple},
    {"name": "Homework Checker", "icon": Icons.check_circle, "color": Colors.teal},
    {"name": "Daily Quiz", "icon": Icons.emoji_events, "color": Colors.amber},
    {"name": "Chat History", "icon": Icons.history, "color": Colors.indigo},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EI CLASSES 🚀", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.indigo.shade50,
            child: Column(
              children: [
                Text("DEEPANSH AI PRO", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo)),
                SizedBox(height: 5),
                Text("India's Smartest AI Study App - 41+ Features", style: TextStyle(color: Colors.black54)),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemCount: features.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${features[i]['name']} Coming Soon! AI Active 🤖")));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(features[i]['icon'], size: 40, color: features[i]['color']),
                        SizedBox(height: 10),
                        Text(features[i]['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Ask AI Doubt"),
        icon: Icon(Icons.chat_bubble),
      ),
    );
  }
}
