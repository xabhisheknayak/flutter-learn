import 'package:testmodule2/models/question.dart';

class TestState {
  final List<Question> questions;
  final int currentIndex;
  final Map<int, int> selectedAnswers;
  final bool isCompleted;

  const TestState({
    required this.questions,
    this.currentIndex = 0,
    this.selectedAnswers = const {},
    this.isCompleted = false,
  });

  int get score {
    int correct = 0;
    selectedAnswers.forEach((questionIndex, selectedOption) {
      if (questions[questionIndex].correctIndex == selectedOption) {
        correct++;
      }
    });
    return correct;
  }

  int get totalQuestions => questions.length;

  Question get currentQuestion => questions[currentIndex];

  bool get isLastQuestion => currentIndex == questions.length - 1;

  int? get currentSelectedAnswer => selectedAnswers[currentIndex];

  TestState copyWith({
    List<Question>? questions,
    int? currentIndex,
    Map<int, int>? selectedAnswers,
    bool? isCompleted,
  }) {
    return TestState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
