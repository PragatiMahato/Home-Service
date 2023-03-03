import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Modal/service_modal.dart';
import 'Screen/booking.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ServicesNotifier(),
      child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.system,
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: Booking()),
    );
  }
}
