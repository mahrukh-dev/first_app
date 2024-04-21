import 'package:first_app/screens/RegistrationPage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/login.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}
class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {

  //intialy show login page
   bool showLoginPage = true;
// toggle pages b/w login or register
  void togglePages()
  {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage)
      {
        return LoginPage(onTap: togglePages);
      }
    else
      {
        return RegistrationPage(onTap: togglePages);
      }
  }
}
