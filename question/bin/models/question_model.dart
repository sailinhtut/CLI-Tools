class Question {
  final String choiceOne;
  final String choiceTwo;
  late String question;

  Question(this.choiceOne, this.choiceTwo) {
    question =
        'Which do you prefer ${_internalize(choiceOne)} or ${_internalize(choiceTwo)}?\n1. ${_captilize(choiceOne)}  2. ${_captilize(choiceTwo)}';
  }

  factory Question.fromJson(
      Map<String, dynamic> json) {
    return Question(
        json['choiceOne'], json['choiceTwo']);
  }

  Map<String, dynamic> toJson() {
    return {
      'choiceOne': choiceOne,
      'choiceTwo': choiceTwo
    };
  }

  String _captilize(String word) {
    String first = word.substring(0, 1);
    return word.replaceFirst(
        first, first.toUpperCase());
  }

  String _internalize(String word) {
    String first = word.substring(0, 1);
    return word.replaceFirst(
        first, first.toLowerCase());
  }
}
