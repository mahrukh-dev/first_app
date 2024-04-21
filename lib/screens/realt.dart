import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  //final auth = FirebaseAuth.instance ;
  final ref = FirebaseDatabase.instance.ref('Monitoringdata');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Real Time"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[100],
      body: Column(
        children: [
          const SizedBox(height: 30),

          // welcome back, you've been missed!
          Text(
            '       Experince the Real time capacity of your cylinder',
            style: TextStyle(
              color: Colors.brown[900],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 50),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Text('Wait for a while'),
                itemBuilder: (context, snapshot, animation, index) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          snapshot.value.toString(),
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),

                        // welcome back, you've been missed!
                        Text(
                          'Grams',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 50.0,
                          ),
                        ),

                        const SizedBox(height: 100),

                        // sign in button
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Back to Home'),
                            style: ElevatedButton.styleFrom(
                                // padding: EdgeInsetsDirectional.symmetric(horizontal: 80.0, vertical: 20.0),
                                fixedSize: Size(300.0, 50.0),
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.orange,
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
