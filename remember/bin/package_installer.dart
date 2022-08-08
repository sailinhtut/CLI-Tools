import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:args/command_runner.dart';
import 'dart:io';





class IntegrateCommand extends Command 
{  
  @override
  String get name => "install";
  
  @override
  String get description => "To install pub package into your project";

  @override 
  void run()
  {
     _installPackage(argResults!.arguments.first);
  }
}

void _installPackage(String first) async
{
   // Getting Json Repsonse Body  
   final response = await http.get(Uri.parse('https://pub.dev/api/packages/$first'));


   print("Your Package Name is $first");

   if(response.statusCode == HttpStatus.notFound )
   {
      print('Oppos ! it look like package name you searched is not existed');
   }
  
   final data = json.decode(response.body);
   String lastestVersion = data['latest']['version'];
   
   print('The lastest verion of $first is $lastestVersion');

   final currentDir = Directory.current.path;

  final modi = currentDir.replaceFirstMapped('bin',((match) => ''));

  final pubspec = join(modi,'pubspec.yaml');

   final fileData = File(pubspec).readAsStringSync();

   final updated = fileData.replaceFirst('dependencies:','dependencies:\n  $first : $lastestVersion');

   File(pubspec).writeAsStringSync(updated);

   Process.run('start $pubspec',[],runInShell: true);
   

}