import 'package:flutter/material.dart';

void main() => runApp(EIClassesApp());

class EIClassesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EI CLASSES',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.school, size: 80, color: Colors.deepPurple),
            SizedBox(height: 10),
            Text("EI-CLASSES", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text("DEEPANSHU ARYA", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 30),
            TextField(controller: userCtrl, decoration: InputDecoration(labelText: "Username", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person))),
            SizedBox(height: 15),
            TextField(controller: passCtrl, obscureText: true, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock))),
            SizedBox(height: 25),
            SizedBox(width: double.infinity, height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (userCtrl.text == "admin" && passCtrl.text == "1234") {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong! Use admin / 1234")));
                  }
                },
                child: Text("LOGIN", style: TextStyle(fontSize: 18)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> students = [];

  void addStudent() {
    var nameC = TextEditingController();
    var feesC = TextEditingController();
    var phoneC = TextEditingController();
    showDialog(context: context, builder: (_) => AlertDialog(
      title: Text("Add Student"),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: nameC, decoration: InputDecoration(labelText: "Name")),
        TextField(controller: feesC, decoration: InputDecoration(labelText: "Fees"), keyboardType: TextInputType.number),
        TextField(controller: phoneC, decoration: InputDecoration(labelText: "Phone")),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        ElevatedButton(onPressed: () {
          setState(() { students.add({"name": nameC.text, "fees": feesC.text, "phone": phoneC.text}); });
          Navigator.pop(context);
        }, child: Text("Save")),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EI-Classes Students (${students.length})")),
      body: students.isEmpty
       ? Center(child: Text("No Students Yet\nClick + to Add", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.grey)))
        : ListView.builder(itemCount: students.length, itemBuilder: (c,i) => Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(students[i]['name']![0].toUpperCase())),
              title: Text(students[i]['name']!),
              subtitle: Text("Fees: ₹${students[i]['fees']} | ${students[i]['phone']}"),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: (){ setState((){ students.removeAt(i); }); }),
            ),
          )),
      floatingActionButton: FloatingActionButton(onPressed: addStudent, child: Icon(Icons.add)),
    );
  }
}
