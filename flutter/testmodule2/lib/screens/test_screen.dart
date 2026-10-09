import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmodule2/cubit/test_cubit.dart';
import 'package:testmodule2/cubit/test_state.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assessment'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<TestCubit, TestState>(
        builder: (context, state) {
          if (state.isCompleted) {
            return _buildResultView(context, state);
          }
          return _buildQuestionView(context, state);
        },
      ),
    );
  }

  Widget _buildQuestionView(BuildContext context, TestState state) {
    final question = state.currentQuestion;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LinearProgressIndicator(
            value: (state.currentIndex + 1) / state.totalQuestions,
            backgroundColor: Colors.grey[300],
            color: Colors.deepPurple,
          ),
          const SizedBox(height: 12),
          Text(
            'Question ${state.currentIndex + 1} of ${state.totalQuestions}',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Text(
            question.text,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ...List.generate(question.options.length, (index) {
            final isSelected = state.currentSelectedAnswer == index;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: OutlinedButton(
                onPressed: () {
                  context.read<TestCubit>().selectAnswer(index);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  side: BorderSide(
                    color: isSelected ? Colors.deepPurple : Colors.grey,
                    width: isSelected ? 2 : 1,
                  ),
                  backgroundColor:
                      isSelected ? Colors.deepPurple.withAlpha(25) : null,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    question.options[index],
                    style: TextStyle(
                      fontSize: 16,
                      color: isSelected ? Colors.deepPurple : Colors.black87,
                    ),
                  ),
                ),
              ),
            );
          }),
          const Spacer(),
          Row(
            children: [
              if (state.currentIndex > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      context.read<TestCubit>().previousQuestion();
                    },
                    child: const Text('Previous'),
                  ),
                ),
              if (state.currentIndex > 0) const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: state.currentSelectedAnswer != null
                      ? () {
                          if (state.isLastQuestion) {
                            context.read<TestCubit>().submitTest();
                          } else {
                            context.read<TestCubit>().nextQuestion();
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: Text(state.isLastQuestion ? 'Submit' : 'Next'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResultView(BuildContext context, TestState state) {
    final percentage = (state.score / state.totalQuestions * 100).round();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              percentage >= 60 ? Icons.check_circle : Icons.cancel,
              size: 80,
              color: percentage >= 60 ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 24),
            Text(
              percentage >= 60 ? 'Passed!' : 'Failed',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Score: ${state.score} / ${state.totalQuestions} ($percentage%)',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.read<TestCubit>().resetTest();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Retake Test', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
