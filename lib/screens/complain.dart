import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:first_app/components/myfeedbackfield.dart';

class complainPage extends StatefulWidget {
  const complainPage({Key? key}) : super(key: key);

  @override
  State<complainPage> createState() => complainPageState();
}

class complainPageState extends State<complainPage> {
  //final auth = FirebaseAuth.instance ;
  final complainController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future Addcomplain() async {
    var FireUser = FirebaseAuth.instance.currentUser!;

    await FirebaseFirestore.instance
        .collection('complaint')
        .doc(FireUser.uid)
        .set({
      'email': FireUser.email.toString(),
      'Complaint': complainController.text.trim(),
    });
    showsucess('Complaint & queries Submitted');
  }

  void showsucess(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.check_box,
            color: Colors.green,
            size: 60.0,
          ),
          backgroundColor: Colors.orangeAccent[200],
          title: Center(
              child: Text(
            message,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complain & Queries"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Feedback is valueable to us',
            style: GoogleFonts.montserrat(fontSize: 18.0),
          ),

          const SizedBox(height: 25.0),
          // Note: Same code is applied for the TextFormField as well
          MyFeedbackField(
            controller: complainController,
            hintText: 'Complain & Queries',
            obscureText: false,
          ),

          const SizedBox(height: 25.0),

          ElevatedButton(
              onPressed: () {
                Addcomplain();
              },
              //child: Text('Complaints & Queries'),
              style: ElevatedButton.styleFrom(
                  // padding: EdgeInsetsDirectional.symmetric(horizontal: 80.0, vertical: 20.0),
                  fixedSize: Size(300.0, 50.0),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.orange,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    // <-- Icon
                    Icons.question_answer_outlined,
                    size: 20.0,
                  ),
                  const SizedBox(width: 8.0),
                  const Text(
                    'Submit',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
