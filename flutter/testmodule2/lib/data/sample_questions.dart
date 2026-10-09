import 'package:testmodule2/models/question.dart';

final sampleQuestions = [
  const Question(
    text: 'Who is the main protagonist of Naruto?',
    options: [
      'Sasuke Uchiha',
      'Naruto Uzumaki',
      'Kakashi Hatake',
      'Itachi Uchiha',
    ],
    correctIndex: 1,
  ),
  const Question(
    text: 'What is the name of Luffy\'s pirate crew in One Piece?',
    options: [
      'Red Hair Pirates',
      'Whitebeard Pirates',
      'Straw Hat Pirates',
      'Heart Pirates',
    ],
    correctIndex: 2,
  ),
  const Question(
    text: 'In Death Note, what is the name of the Shinigami who drops the notebook?',
    options: [
      'Rem',
      'Gelus',
      'Sidoh',
      'Ryuk',
    ],
    correctIndex: 3,
  ),
  const Question(
    text: 'What is Goku\'s Saiyan name in Dragon Ball Z?',
    options: [
      'Kakarot',
      'Vegeta',
      'Bardock',
      'Raditz',
    ],
    correctIndex: 0,
  ),
  const Question(
    text: 'Which anime features the Survey Corps fighting Titans?',
    options: [
      'Demon Slayer',
      'Jujutsu Kaisen',
      'Attack on Titan',
      'Bleach',
    ],
    correctIndex: 2,
  ),
];
