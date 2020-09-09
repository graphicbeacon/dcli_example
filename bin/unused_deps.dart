#! /usr/bin/env dcli

import 'dart:io';
import 'package:dcli/dcli.dart';
import 'package:yaml/yaml.dart';

void main(List<String> args) {
  final pubspec = File('./pubspec.yaml').readAsStringSync();
  final doc = loadYaml(pubspec); // {}

  echo(
      '# Checking pubspec.yaml for dependencies that\n'
      "# aren't referenced in import statements...",
      newline: true);

  print('\ndependencies:');
  printListOfUnusedPackagesWithIndents(doc['dependencies']);

  print('\ndependency_overrides:');
  printListOfUnusedPackagesWithIndents(doc['dependency_overrides']);

  print('\ndev_dependencies:');
  printListOfUnusedPackagesWithIndents(doc['dev_dependencies']);
}

void printListOfUnusedPackagesWithIndents(Map packages) {
  if (packages == null) {
    print('  No packages found.');
    return;
  }

  for (var packageName in packages.keys) {
    // Check if package is used in project
    final isUsingPackage = isUsedInProject(packageName);
    if (!isUsingPackage) {
      print(orange('  $packageName'));
    }
  }
}

bool isUsedInProject(String packageName) {
  try {
    'grep -Ril "import \'package:$packageName" ./lib'.forEach((line) {});
    return true;
  } catch (e) {
    return false;
  }
}
