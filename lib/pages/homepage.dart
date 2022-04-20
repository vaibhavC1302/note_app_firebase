import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app_firebase/pages/addnote.dart';
import 'package:note_app_firebase/pages/viewnote.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  // List<Color> mycolors = [
  //   Colors.yellow,
  //   Colors.red,
  //   Colors.green,
  //   Colors.deepPurple
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => const AddNote(),
              ),
            )
                .then((value) {
              setState(() {});
            });
          },
          backgroundColor: Colors.grey[700],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "Notes",
            style: TextStyle(
                fontSize: 32,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          backgroundColor: const Color(0xff070706),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(12),
                child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: ((context, index) {
                      // Random random = Random();
                      Color bg = Colors.orangeAccent;
                      Map? data = snapshot.data?.docs[index].data() as Map?;
                      DateTime myDateTime = data!['created'].toDate();
                      String formattedtime =
                          DateFormat.yMMMd().add_jm().format(myDateTime);
                      return InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: ((context) => ViewNote(
                                    data: data,
                                    time: formattedtime,
                                    ref: snapshot.data!.docs[index].reference,
                                  )),
                            ),
                          )
                              .then((value) {
                            setState(() {});
                          });
                        },
                        child: Card(
                          color: bg,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data['title']}",
                                  style: const TextStyle(
                                      fontSize: 32,
                                      fontFamily: "Lato",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    formattedtime,
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Lato",
                                        color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              );
            } else {
              return const Center(
                child: Text('Loading....'),
              );
            }
          },
        ));
  }
}
