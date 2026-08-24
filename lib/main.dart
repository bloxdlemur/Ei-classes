import 'package:flutter/material.dart';
void main() => runApp(EIClassesApp());
class EIClassesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, title: 'EI CLASSES', home: Dashboard());
  }
}
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  List students = [
    {"name": "Rohan Kumar", "class": "10th", "fees": 2000, "paid": true},
    {"name": "Priya Sharma", "class": "9th", "fees": 1500, "paid": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EI-CLASSES"), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
      body: ListView.builder(itemCount: students.length, itemBuilder: (c,i)=> Card(child: ListTile(title: Text(students[i]['name']), subtitle: Text("Class ${students[i]['class']} - ₹${students[i]['fees']}"), trailing: Icon(students[i]['paid']?Icons.check:Icons.close, color: students[i]['paid']?Colors.green:Colors.red), onTap: (){setState(()=>students[i]['paid']=!students[i]['paid']);}))),
      floatingActionButton: FloatingActionButton(onPressed: (){setState(()=>students.add({"name":"New Student","class":"10th","fees":1000,"paid":false}));}, child: Icon(Icons.add)),
    );
  }
}
