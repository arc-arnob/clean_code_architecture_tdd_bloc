import 'package:clean_code_architecture_tdd/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Clean Code Architecture',
        theme: ThemeData(
            primaryColor: Colors.purple.shade400,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.purple)),
        home: NumberTriviaPage());
  }
}
