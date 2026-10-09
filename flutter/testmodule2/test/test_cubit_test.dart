import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testmodule2/cubit/test_cubit.dart';
import 'package:testmodule2/cubit/test_state.dart';
import 'package:testmodule2/models/question.dart';

final _testQuestions = [
  const Question(
    text: 'What is 2 + 2?',
    options: ['3', '4', '5', '6'],
    correctIndex: 1,
  ),
  const Question(
    text: 'What is 3 + 3?',
    options: ['5', '6', '7', '8'],
    correctIndex: 1,
  ),
  const Question(
    text: 'What is 5 + 5?',
    options: ['8', '9', '10', '11'],
    correctIndex: 2,
  ),
];

void main() {
  group('TestCubit', () {
    late TestCubit cubit;

    setUp(() {
      cubit = TestCubit(questions: _testQuestions);
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state has currentIndex 0 and no answers', () {
      expect(cubit.state.currentIndex, 0);
      expect(cubit.state.selectedAnswers, isEmpty);
      expect(cubit.state.isCompleted, false);
      expect(cubit.state.score, 0);
    });

    blocTest<TestCubit, TestState>(
      'selectAnswer stores the chosen option for current question',
      build: () => TestCubit(questions: _testQuestions),
      act: (cubit) => cubit.selectAnswer(1),
      expect: () => [
        isA<TestState>()
            .having((s) => s.selectedAnswers[0], 'answer for q0', 1),
      ],
    );

    blocTest<TestCubit, TestState>(
      'selectAnswer can change answer for the same question',
      build: () => TestCubit(questions: _testQuestions),
      act: (cubit) {
        cubit.selectAnswer(0);
        cubit.selectAnswer(2);
      },
      expect: () => [
        isA<TestState>()
            .having((s) => s.selectedAnswers[0], 'first pick', 0),
        isA<TestState>()
            .having((s) => s.selectedAnswers[0], 'changed pick', 2),
      ],
    );

    blocTest<TestCubit, TestState>(
      'nextQuestion increments currentIndex',
      build: () => TestCubit(questions: _testQuestions),
      act: (cubit) => cubit.nextQuestion(),
      expect: () => [
        isA<TestState>().having((s) => s.currentIndex, 'index', 1),
      ],
    );

    blocTest<TestCubit, TestState>(
      'nextQuestion does nothing on the last question',
      build: () => TestCubit(questions: _testQuestions),
      seed: () => TestState(
        questions: _testQuestions,
        currentIndex: 2,
      ),
      act: (cubit) => cubit.nextQuestion(),
      expect: () => [],
    );

    blocTest<TestCubit, TestState>(
      'previousQuestion decrements currentIndex',
      build: () => TestCubit(questions: _testQuestions),
      seed: () => TestState(
        questions: _testQuestions,
        currentIndex: 1,
      ),
      act: (cubit) => cubit.previousQuestion(),
      expect: () => [
        isA<TestState>().having((s) => s.currentIndex, 'index', 0),
      ],
    );

    blocTest<TestCubit, TestState>(
      'previousQuestion does nothing on the first question',
      build: () => TestCubit(questions: _testQuestions),
      act: (cubit) => cubit.previousQuestion(),
      expect: () => [],
    );

    blocTest<TestCubit, TestState>(
      'submitTest sets isCompleted to true',
      build: () => TestCubit(questions: _testQuestions),
      act: (cubit) => cubit.submitTest(),
      expect: () => [
        isA<TestState>().having((s) => s.isCompleted, 'completed', true),
      ],
    );

    blocTest<TestCubit, TestState>(
      'selectAnswer does nothing after test is submitted',
      build: () => TestCubit(questions: _testQuestions),
      seed: () => TestState(
        questions: _testQuestions,
        isCompleted: true,
      ),
      act: (cubit) => cubit.selectAnswer(0),
      expect: () => [],
    );

    blocTest<TestCubit, TestState>(
      'resetTest clears all answers and goes back to question 0',
      build: () => TestCubit(questions: _testQuestions),
      seed: () => TestState(
        questions: _testQuestions,
        currentIndex: 2,
        selectedAnswers: {0: 1, 1: 1, 2: 2},
        isCompleted: true,
      ),
      act: (cubit) => cubit.resetTest(),
      expect: () => [
        isA<TestState>()
            .having((s) => s.currentIndex, 'index', 0)
            .having((s) => s.selectedAnswers, 'answers', isEmpty)
            .having((s) => s.isCompleted, 'completed', false),
      ],
    );

    blocTest<TestCubit, TestState>(
      'score counts only correct answers',
      build: () => TestCubit(questions: _testQuestions),
      seed: () => TestState(
        questions: _testQuestions,
        selectedAnswers: {0: 1, 1: 0, 2: 2},
      ),
      verify: (cubit) {
        expect(cubit.state.score, 2);
      },
    );

    blocTest<TestCubit, TestState>(
      'full flow: answer all questions correctly and submit',
      build: () => TestCubit(questions: _testQuestions),
      act: (cubit) {
        cubit.selectAnswer(1);
        cubit.nextQuestion();
        cubit.selectAnswer(1);
        cubit.nextQuestion();
        cubit.selectAnswer(2);
        cubit.submitTest();
      },
      verify: (cubit) {
        expect(cubit.state.isCompleted, true);
        expect(cubit.state.score, 3);
        expect(cubit.state.totalQuestions, 3);
      },
    );
  });
}
