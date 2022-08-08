import 'dart:io';
import 'dart:convert';
import 'models/question_generator_model.dart';
import 'models/question_model.dart';

class CLI {
  List<QuestionGenerator> database = [];

  static int count = 0;

  // run
  Future<void> run() async {
    await loadData();
    greet();
  }

  // command interface
  void greet() {
    print(
        '\nWelcome to question generator\n1. Create Questions Bundle \n2. Ask Question Bundle \n3. See Bundle Respitary \n4. Delete Bundle \n5. Save \n6. Quit');

    int decision = 0;

    try {
      decision = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print(e);
      greet();
    }

    if (decision == 1) {
      createQuestionBundle();
    } else if (decision == 2) {
      askQuestionBundle();
      greet();
    } else if (decision == 3) {
      seeBundleRepositary();
      greet();
    } else if (decision == 4) {
      deleteRepositary();
      greet();
    } else if (decision == 5) {
      saveData();
      greet();
    } else if (decision == 6) {
      print("\nSee You Again");
      return;
    } else {
      greet();
    }
  }

  void createQuestionBundle() {
    print("Enter repositary name : ");

    String name = '';

    try {
      count++;
      name = stdin.readLineSync() ??
          "Unknown $count";
    } catch (e) {
      print(e);
      createQuestionBundle();
    }

    QuestionGenerator generator =
        QuestionGenerator(name);

    print(
        'How many questions do you want to ask?');

    int total = 0;

    try {
      total = int.parse(stdin.readLineSync(
          retainNewlines: false)!);
    } catch (e) {
      print(e);
      createQuestionBundle();
    }

    if (total <= 0) {
      print('Invalid Total Number. Try again..');
      createQuestionBundle();
    } else {
      for (int i = 0; i <= total; i++) {
        if (i == 0) {
          generator.add(_createQuestion(++i,
              showExample: true));
        } else {
          generator.add(_createQuestion(i));
        }
      }

      database.add(generator);
    }

    greet();
  }

  Question _createQuestion(int count,
      {bool showExample = false}) {
    print(
        '\nQuestion Create $count : Enter 2 values.First is for first choice and second is for second choice${showExample ? '\nExample : "car" (Press "Enter") "train" (Press "Enter")\nQuestion will be generated.' : ''}');
    String firstValue = '';
    String secondValue = '';

    try {
      print('First Value : ');
      firstValue = stdin.readLineSync(
          retainNewlines: false)!;
      print('Second Value : ');
      secondValue = stdin.readLineSync(
          retainNewlines: false)!;
    } catch (e) {
      print(e);
      _createQuestion(count);
    }

    final question =
        Question(firstValue, secondValue);

    return question;
  }

  void askQuestionBundle() {
    print(
        'Choose what bundle do you want to ask => ');

    seeBundleRepositary();

    int choice = 0;

    try {
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print(e);
      askQuestionBundle();
    }

    database[--choice]
        .run("Answer One", "Answer Two");
  }

  void deleteRepositary() {
    print(
        'Choose you repositary do you want to delete =>');
    seeBundleRepositary();

    int choice = 0;

    try {
      choice = int.parse(stdin.readLineSync()!);
    } catch (e) {
      print(e);
      askQuestionBundle();
    }

    database.removeAt(--choice);
  }

  void saveData() {
    File file = File('questionData.json');

    try {
      final dataRaw = database
          .map((e) => e.toJson())
          .toList();
      String jsonString = json.encode(dataRaw);

      file.writeAsStringSync(
        jsonString,
      );

      print('Data is successfully saved');
    } catch (e) {
      print('\nError : $e');
    }
  }

  Future<void> loadData() async {
    try {
      File file = File('questionData.json');

      String data = await file.readAsString();

      final dataList = json.decode(data);

      database = (dataList as List)
          .map((e) =>
              QuestionGenerator.fromJson((e)))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  void seeBundleRepositary() {
    print("\nYour Repositaries");

    if (database.isEmpty) {
      print('There is no question repositary.');
    } else {
      for (QuestionGenerator generator
          in database) {
        int seq = database.indexOf(generator);
        print('${++seq} : ${generator.name} ');
      }
    }
  }
}
