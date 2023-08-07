import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  String name;
  String phoneNumber;

  Student({required this.name, required this.phoneNumber});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        hintColor: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
          title: Text(
            'Student List',
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
        body: StudentForm(),
      ),
    );
  }
}

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final List<Student> students = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.0,
              height: MediaQuery.of(context).size.height / 3.0,
              color: Colors.red,
              child: Center(
                child: Text(
                  "A1",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.0,
              height: MediaQuery.of(context).size.height / 3.0,
              color: Colors.yellow,
              child: Center(
                child: Text(
                  "A2",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.0,
              height: MediaQuery.of(context).size.height / 3.0,
              color: Colors.deepPurple,
              child: Center(
                child: Text(
                  "A3",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.0,
              height: MediaQuery.of(context).size.height / 2.0,
              color: Colors.lightBlueAccent,
              child: Center(
                child: Text(
                  "B1",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.0,
              height: MediaQuery.of(context).size.height / 2.0,
              color: Colors.green,
              child: Center(
                child: Text(
                  "B2",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[100],
                    foregroundColor: Colors.deepPurple),
                onPressed: () {
                  // Save the data and update the list view
                  String name = _nameController.text;
                  String phoneNumber = _phoneNumberController.text;
                  setState(() {
                    students.add(Student(name: name, phoneNumber: phoneNumber));
                    _nameController.clear();
                    _phoneNumberController.clear();
                  });
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(students.length, (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: StudentCard(student: students[index]),
                    );
                  }),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class StudentCard extends StatelessWidget {
  final Student student;

  StudentCard({required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: 200, // You can adjust the card width here
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student.name}'),
            SizedBox(height: 8.0),
            Text('Phone: ${student.phoneNumber}'),
          ],
        ),
      ),
    );
  }
}
