import 'package:barbar/Providers/location_provider.dart';
import 'package:barbar/Utils/bottom_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyB9ouq0JwX2s9gbhrHluZ3x44Pl2olHNJo',
    appId: '1:711046508867:android:70a548fc675566f310bff6',
    messagingSenderId: '711046508867',
    projectId: 'barbars-app',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Barber',
        home: CustomBottomNavigationBar(),
      ),
    );
  }
}
