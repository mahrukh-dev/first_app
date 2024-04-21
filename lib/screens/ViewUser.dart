// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewUserPage extends StatefulWidget {
  const ViewUserPage({super.key});

  @override
  State<ViewUserPage> createState() => _ViewUserPageState();
}

class _ViewUserPageState extends State<ViewUserPage> {
  final TextEditingController _nameController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser!;

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('users');

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

/*
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {

      _nameController.text = documentSnapshot['First name'];
      _phoneController.text = documentSnapshot['phone'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text( 'Update'),
                  onPressed: () async {
                    final String name = _nameController.text;
                    final double? price =
                    double.tryParse(_phoneController.text);
                    if (price != null) {

                      await _products
                          .doc(documentSnapshot!.id)
                          .update({"first name": name, "phone": price});
                      _nameController.text = '';
                      _phoneController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Details"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        backgroundColor: Colors.amber[100],
        body: StreamBuilder(
          stream: _products.snapshots(), //build connection
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length, //number of rows
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  if (documentSnapshot['email'].toString().trim() !=
                      user.email!) {
                    return const Center();
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person, size: 150.0),

                        const SizedBox(height: 10.0),
                        const Text(
                          'User Details',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        Text(
                          'LPGenius'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'SourceSansPro',
                            color: Colors.teal.shade100,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.5,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                          width: 150,
                          child: Divider(
                            color: Colors.orange,
                          ),
                        ),
                        // first name
                        InkWell(
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.person_outline_outlined,
                                color: Colors.teal,
                              ),
                              title: Text(
                                documentSnapshot['First Name'] +
                                    " " +
                                    documentSnapshot['Last Name'],
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 20,
                                    color: Colors.teal.shade900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.location_on_outlined,
                                color: Colors.teal,
                              ),
                              title: Text(
                                documentSnapshot['Address'],
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 20,
                                    color: Colors.teal.shade900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Card(
                            shape: const RoundedRectangleBorder(),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.email,
                                color: Colors.teal,
                              ),
                              title: Text(
                                documentSnapshot['email'],
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 20,
                                    color: Colors.teal.shade900),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: ListTile(
                              leading: const Icon(
                                Icons.phone,
                                color: Colors.teal,
                              ),
                              title: Text(
                                documentSnapshot['phone'],
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 20,
                                    color: Colors.teal.shade900),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
