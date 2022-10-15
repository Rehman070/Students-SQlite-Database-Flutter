import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Modules/Database.dart';
import '../Modules/Students.dart';
import './Students_Record.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formkey = GlobalKey<FormState>();
  late String name, email, phone, course, fee;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Plase Enter Name';
                        }
                        name = text;
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter Name',
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Plase Enter Email';
                        }
                        email = text;
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Plase Enter Phone';
                        }
                        phone = text;
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          hintText: 'Enter Phone',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Plase Enter Course';
                        }
                        course = text;
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Course',
                          hintText: 'Enter Course',
                          prefixIcon: const Icon(Icons.book_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return 'Plase Enter Fee';
                        }
                        fee = text;
                        return null;
                      },
                      decoration: InputDecoration(
                        
                          labelText: 'Fee',
                          hintText: 'Enter Fee',
                          prefixIcon: const Icon(Icons.payment),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            Students students = Students(
                                name: name,
                                email: email,
                                phone: phone,
                                course: course,
                                fee: int.parse(fee));

                            int res = await DataBase.instance
                                .Insert_Students(students);
                            if (res > 0) {
                              Fluttertoast.showToast(msg: 'Record Inserted!');
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Record Not Inserted!');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(9),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(500))),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(CupertinoPageRoute(builder: (context) {
                            return  Students_Records();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(9),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(500))),
                        child: const Text(
                          'View',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        ))
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
