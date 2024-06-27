import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        questionText:
            'Petir terlihat sebelum terdengar karena cahaya merambat lebih cepat daripada suara',
        questionAnswer: true),
    Question(
        questionText: 'Jakarta adalah ibu kota Australia',
        questionAnswer: false),
    Question(
        questionText: 'Gunung ceremai adalah gunung tertinggi di provinsi jawa barat',
        questionAnswer: true),
    Question(
        questionText:
            'Brokoli mengandung lebih banyak vitamin C daripada lemon',
        questionAnswer: true),
    Question(
        questionText: 'Bola lampu adalah penemuan Thomas Edison',
        questionAnswer: false),
    Question(
        questionText: 'Google awalnya bernama BackRub', questionAnswer: true),
    Question(
        questionText: 'Kotak hitam di pesawat berwarna hitam',
        questionAnswer: false),
    Question(
        questionText:
            'Depresi adalah penyebab utama kecacatan di seluruh dunia.',
        questionAnswer: true),
    Question(
        questionText: 'Coca-Cola ada di setiap negara di seluruh dunia',
        questionAnswer: false),
    Question(
        questionText:
            'Di Arizona, AS, Anda bisa dihukum karena menebang kaktus',
        questionAnswer: true),
    Question(
        questionText: 'Semua mamalia hidup di darat', questionAnswer: false),
    Question(
        questionText:
            'Dibutuhkan sembilan bulan bagi seekor gajah untuk dilahirkan.',
        questionAnswer: false),
    Question(
        questionText: 'Kota Vatikan bukan sebuah negara.',
        questionAnswer: false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      ('returning true');
      return true;
    } else {
      return false;
    }
  }

  //TODO: Menghitung jumlah pertanyaan
  int getTotalQuestions() {
    return _questionBank.length;
  }

  //TODO: Step 4 Part B - Create a reset() method that sets the questionNumber back to 0
  void reset() {
    _questionNumber = 0;
  }
}
