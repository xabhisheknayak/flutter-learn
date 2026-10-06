import 'dart:io';

void main(){
    String? name = stdin.readLineSync();
    stdout.writeln("hello $name");
    int? age = int.tryParse(stdin.readLineSync()!);
    stdout.writeln("your age is $age");
}