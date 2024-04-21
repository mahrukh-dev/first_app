import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:first_app/components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // text editing controllers
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose(); // TODO: implement dispose
    super.dispose();
  }

  // sign user in method
  Future forgetPassword() async {
    //check if password is same
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showsucess("Succuesfully sent reset Password Link to your email");
    }
    // firebase exception handling
    on FirebaseAuthException catch (e) {
      showError(e.code);
    }
  }

  void showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.error,
            color: Colors.red,
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

  void showsucess(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.mark_email_read,
            color: Colors.teal[100],
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
        title: Text('Reset Password'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[600],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*const SizedBox(height: 30),
                // logo
                Container(
                  height: 150,
                  child:
                  Image.asset('images/image.png'),

                ),*/
                const SizedBox(height: 20),
                // welcome back, you've been missed!
                Text(
                  'Reset Password',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                // welcome back, you've been missed!
                Text(
                  'Enter your Email',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  icon: Icons.email,
                ),

                const SizedBox(height: 25),

                // sign in button
                ElevatedButton(
                    onPressed: () {
                      forgetPassword();
                    },
                    child: Text('Send Email'),
                    style: ElevatedButton.styleFrom(
                        //padding: EdgeInsetsDirectional.symmetric(horizontal: 80.0, vertical: 20.0),
                        fixedSize: Size(300.0, 50.0),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange,
                        textStyle: TextStyle(fontWeight: FontWeight.bold))),

                const SizedBox(height: 25),

                // sign in button
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back to Login'),
                    style: ElevatedButton.styleFrom(
                        //padding: EdgeInsetsDirectional.symmetric(horizontal: 80.0, vertical: 20.0),
                        fixedSize: Size(300.0, 50.0),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange,
                        textStyle: TextStyle(fontWeight: FontWeight.bold))),
                // not a member? register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
