import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
		theme: ThemeData(primarySwatch: Colors.yellow, useMaterial3: false,
),
		home: HomePage(),
    );
  }
}
