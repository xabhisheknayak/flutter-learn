import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmodule2/cubit/test_state.dart';
import 'package:testmodule2/models/question.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit({required List<Question> questions})
      : super(TestState(questions: questions));

  void selectAnswer(int optionIndex) {
    if (state.isCompleted) return;

    final updatedAnswers = Map<int, int>.from(state.selectedAnswers);
    updatedAnswers[state.currentIndex] = optionIndex;

    emit(state.copyWith(selectedAnswers: updatedAnswers));
  }

  void nextQuestion() {
    if (state.isCompleted) return;
    if (state.currentIndex < state.questions.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1));
    }
  }

  void previousQuestion() {
    if (state.isCompleted) return;
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1));
    }
  }

  void submitTest() {
    if (state.isCompleted) return;
    emit(state.copyWith(isCompleted: true));
  }

  void resetTest() {
    emit(TestState(questions: state.questions));
  }
}
