#! /usr/bin/env dcli

import 'dart:io';
import 'package:dcli/dcli.dart';

void main(List<String> args) {
  print('Now lets do something useful.');

  var username = ask('username:');
  print('=> $username');

  var password = ask(
    blue('password:'),
    hidden: true,
    validator: AskValidatorMinLength(5),
  );
  print('=> $password');

  var hasAgreed = confirm(red('Do you wish to proceed?'));
  if (!hasAgreed) return;

  // check if dir exists
  if (!exists('tmp')) {
    var path = createDir('tmp');
    print(green('Created path: $path'));
  }

  // create file
  'tmp/text.txt'.write('$username:$password');

  // append to file
  'tmp/text.txt'.append('Created on ${DateTime.now()}');

  // copy file
  copy('tmp/text.txt', 'tmp/text_copy.txt', overwrite: true);

  // dump file contents to console
  cat('tmp/text_copy.txt');
  'cat tmp/text_copy.txt'.forEach((line) => print('got line: $line'));

  // find file
  find('*.txt').forEach((file) => print('Found: $file'));

  // tail file
  'tail -n 1 tmp/text.txt'.run;

  // move/rename file
  move('tmp/text.txt', 'tmp/credentials.txt', overwrite: true);

  // confirm deletion
  if (confirm(orange('Are we done?'))) {
    delete('tmp/credentials.txt');

    sleep(3);
    deleteDir('tmp');
  }
}
