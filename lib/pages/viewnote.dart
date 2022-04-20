import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewNote extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;
  const ViewNote(
      {Key? key, required this.data, required this.time, required this.ref})
      : super(key: key);

  @override
  State<ViewNote> createState() => _AddNoViewNote();
}

class _AddNoViewNote extends State<ViewNote> {
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
                      onPressed: delete,
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.data['title']}",
                      style: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Loto',
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        widget.time,
                        style: const TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Loto',
                            color: Colors.grey),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: Text(
                        "${widget.data['description']}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Lato',
                            color: Colors.grey),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void delete() async {
    await widget.ref.delete();

    Navigator.pop(context);
  }
}
