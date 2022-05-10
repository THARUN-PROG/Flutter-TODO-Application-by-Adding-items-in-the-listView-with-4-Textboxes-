import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adding items in TODO List Application',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'ListView - Adding Items'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final myController = TextEditingController();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();
  final rollnoController = TextEditingController();
  final deptController = TextEditingController();
  final contactnoController = TextEditingController();

  List<Students> students = [
    Students("THARUN S", "19", "INFORMATION TECHNOLOGY", '8667521996'),
  ];

  get rollnumberController => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content:
                        Column(mainAxisSize: MainAxisSize.min,

                            children: [
                              TextField(
                                controller: nameController,
                                decoration: InputDecoration(hintText: 'NAME'),

                              ),
                              TextField(
                                decoration: const InputDecoration(hintText: 'ROLL NUMBER'),
                                controller: rollnumberController,
                              ),
                              TextField(
                                decoration: const InputDecoration(hintText: 'DEPARTMENT'),
                                controller: deptController,
                              ),
                              TextField(
                                decoration: const InputDecoration(hintText: 'CONTACT NUMBER'),
                                controller: contactnoController,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      Students stu = Students(nameController.text, rollnoController.text, deptController.text, contactnoController.text);
                                      nameController.clear();
                                      rollnoController.clear();
                                      deptController.clear();
                                      contactnoController.clear();
                                      students.add(stu);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text("+")),
                            ]));
                  });
            }),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) =>
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  content:
                                  Row(
                                      children:[
                                        Expanded(
                                            child:
                                            Column(mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 32,
                                                    backgroundImage: NetworkImage(
                                                        'https://picsum.photos/200/300'),
                                                  ),


                                                  Text(
                                                    students[index].name,
                                                  ),

                                                  Text(
                                                    students[index].rollno,
                                                  ),

                                                  Text(
                                                    students[index].dept,
                                                  ),

                                                  Text(
                                                    students[index].contactno,
                                                  ),

                                                ]
                                            ))
                                      ]
                                  )
                              );
                            });
                      },
                      child:
                      Card(
                          margin: EdgeInsets.all(6.8),
                          child:
                          ListTile(
                            contentPadding: EdgeInsets.all(12.5),
                            title: Text(students[index].name),
                            subtitle: Text(students[index].dept),
                            tileColor: Colors.black12,
                            leading: CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage("assets/images/THARUN.jpeg")),
                            trailing: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    students.removeAt(index);
                                  });
                                },
                                child: Text("X")),
                          )),
                    ),
              )
          )
        ]
        )
    );
  }
}

class Students {
  String name;
  String rollno;
  String dept;
  String contactno;
  Students(this.name, this.rollno, this.dept, this.contactno);
}
