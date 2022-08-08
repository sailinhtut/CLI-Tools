

import 'dart:io';

import 'package:args/command_runner.dart';
import './package_installer.dart';

void main(List<String> args) 
{
   var runner = CommandRunner('remember',"My Easy Development Tool for flutter framework");
   
   // Adding Install Command 
   runner.addCommand(IntegrateCommand());


   // Parsing and Running Arguments 
   runner.run(args);  
}