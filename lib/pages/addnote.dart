import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  late String title;
  late String des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 20,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 8),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: add,
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Lato",
                            color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 8),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12.0),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:
                            const InputDecoration.collapsed(hintText: 'Title'),
                        style: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Loto',
                            color: Colors.grey),
                        onChanged: (_val) {
                          title = _val;
                        },
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        padding: const EdgeInsets.only(top: 12.0),
                        child: TextFormField(
                          decoration: const InputDecoration.collapsed(
                              hintText: "Description"),
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Lato',
                              color: Colors.grey),
                          onChanged: (_val) {
                            des = _val;
                          },
                          maxLines: 20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void add() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('notes');

    var data = {'title': title, "description": des, 'created': DateTime.now()};

    ref.add(data);

    Navigator.pop(context);
  }
}
