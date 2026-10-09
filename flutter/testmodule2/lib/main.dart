import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmodule2/cubit/test_cubit.dart';
import 'package:testmodule2/data/sample_questions.dart';
import 'package:testmodule2/screens/test_screen.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Module 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => TestCubit(questions: sampleQuestions),
        child: const TestScreen(),
      ),
    );
  }
}
