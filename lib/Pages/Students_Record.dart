import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqlte_database/Modules/Students.dart';
import 'package:sqlte_database/Pages/Update_Students.dart';
import '../Modules/Database.dart';

class Students_Records extends StatefulWidget {
  const Students_Records({
    Key? key,
  }) : super(key: key);

  @override
  State<Students_Records> createState() => _Students_RecordsState();
}

class _Students_RecordsState extends State<Students_Records> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
            future: DataBase.instance.Get_Students(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              } else {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Record Not Found!'),
                  );
                } else {
                  List<Students> snaps = snapshot.data!;
                  
                  return ListView.builder(
                      itemCount: snaps.length,
                      itemBuilder: (context, index) {
                        Students s = snaps[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(top: 6, bottom: 5),
                          width: 200,
                          height: 150,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name :   ${s.name}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text("Email :    ${s.email}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text("Phone :  ${s.phone}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text("Course : ${s.course}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text("Fee :       ${s.fee}",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500))
                                    ]),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        String res = await Navigator.of(context)
                                            .push(CupertinoPageRoute(
                                                builder: ((context) =>
                                                    Update_Students(
                                                      students: s,
                                                    ))));

                                        if (res == 'Done') {
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title:
                                                    const Text("Confirmation"),
                                                content: const Text(
                                                    "Are You Sure to Delete?"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text("No")),
                                                  TextButton(
                                                      onPressed: () async {
                                                        Navigator.of(context)
                                                            .pop();
                                                        int res = await DataBase
                                                            .instance
                                                            .Delete_Students(
                                                                s.id!);

                                                        if (res > 0) {
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'Record Delete!');
                                                          setState(() {});
                                                        }
                                                      },
                                                      child: const Text("Yes"))
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                ],
                              )
                            ],
                          ),
                        );
                      });
                }
              }
            })),
      ),
    );
  }
}
