
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/components/signupbtn.dart';
import 'package:flutter/material.dart';
import 'package:first_app/components/my_textfield.dart';

import 'login.dart';

class RegistrationPage extends StatefulWidget {
  final Function()? onTap;
  RegistrationPage({super.key, required this.onTap});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final f_nameController = TextEditingController();
  final l_nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    f_nameController.dispose();
    l_nameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // sign user in method
  Future signUserUp() async {
    //check if password is same
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        AddUserDetails(
            f_nameController.text.trim(),
            l_nameController.text.trim(),
            addressController.text.trim(),
            phoneController.text.trim(),
            emailController.text.trim());
      }
      // firebase exception handling
      on FirebaseAuthException catch (e) {
        showError(e.code);
      }

    } else {
      showError("password not match");
    }
  }

  Future AddUserDetails(String f_name, String l_name, String address,
      String phone, String email) async {
    var FireUser = FirebaseAuth.instance.currentUser!;

    await FirebaseFirestore.instance.collection('users').doc(FireUser.uid).set({
      'First Name': f_name,
      'Last Name': l_name,
      'Address': address,
      'phone': phone,
      'email': email
    });
  }

  /*void signUserUp() async {
    //check if password is same
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }
      // firebase exception handling
      on FirebaseAuthException catch (e) {
        showError(e.code);
      }
    } else {
      showError("password not match");
    }
  }*/

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                // welcome back, you've been missed!
                Text(
                  'Let\'s create an Account',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 15),

                // First Name textfield
                MyTextField(
                  controller: f_nameController,
                  hintText: 'First Name',
                  obscureText: false,
                  icon: Icons.account_circle_rounded,
                ),

                const SizedBox(height: 10),

                // Last Name field
                MyTextField(
                  controller: l_nameController,
                  hintText: 'Last Name',
                  obscureText: false,
                    icon: Icons.account_circle_rounded
                ),

                const SizedBox(height: 10),

                // address textfield
                MyTextField(
                  controller: addressController,
                  hintText: 'Address',
                  obscureText: false,
                  icon: Icons.house,
                ),

                //phone textfield
                const SizedBox(height: 10),

                // Phone textfield
                MyTextField(
                  controller: phoneController,
                  hintText: 'Phone',
                  obscureText: false,
                  icon: Icons.phone,
                ),

                const SizedBox(height: 10),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                  icon: Icons.email,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  icon: Icons.password,
                ),

                const SizedBox(height: 10),

                // confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                  icon: Icons.password,
                ),

                const SizedBox(height: 5.0),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5.0),

                // sign in button
                SignUpButton(
                  onTap: signUserUp,
                ),

                const SizedBox(height: 10),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
