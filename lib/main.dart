import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/auth.dart';
import 'package:provider/provider.dart';
import 'components/CartItemsProvider.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartItemsProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LPGenius',
      home: Authpage(),
    );

  }
}
