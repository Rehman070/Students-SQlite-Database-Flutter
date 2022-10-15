import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqlte_database/Modules/Database.dart';
import 'package:sqlte_database/Modules/Students.dart';

class Update_Students extends StatefulWidget {
  Students students;
  Update_Students({Key? key, required this.students}) : super(key: key);

  @override
  State<Update_Students> createState() => _Update_StudentsState();
}

class _Update_StudentsState extends State<Update_Students> {
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
                      initialValue: widget.students.name,
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
                      initialValue: widget.students.email,
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
                      initialValue: widget.students.phone,
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
                      initialValue: widget.students.course,
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
                      initialValue: widget.students.fee.toString(),
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
                            Students s = Students(
                                id: widget.students.id,
                                name: name,
                                email: email,
                                phone: phone,
                                course: course,
                                fee: int.parse(fee));

                            int res = await DataBase.instance.Update_Student(s);

                            if (res > 0) {
                              Fluttertoast.showToast(msg: 'Record Updated!');
                               Navigator.of(context).pop('Done');
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Record Not Updated!');
                             
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(9),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(500))),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w400),
                        )),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
