import 'dart:io';

void main() async {
  // Get user input for paths
  print('Enter the path of the project:');
  String projectPath = stdin.readLineSync() ?? '';

  print('Enter the path of the screens folder relative to the project path:');
  String screensFolderPath = stdin.readLineSync() ?? '';

  print('Enter the path of the routes folder relative to the project path:');
  String routesFolderPath = stdin.readLineSync() ?? '';

  // Construct the absolute paths
  final screensFolder = Directory('$projectPath/$screensFolderPath');
  final routesFolder = Directory('$projectPath/$routesFolderPath');

  if (!screensFolder.existsSync()) {
    print('Screens folder does not exist.');
    return;
  }

  if (!routesFolder.existsSync()) {
    print('Routes folder does not exist.');
    return;
  }

  // List all Dart files in the screens folder
  final screenFiles = screensFolder
      .listSync()
      .where((entity) =>
  entity is File && entity.path.endsWith('.dart'))
      .toList();

  // Filter files by naming convention
  final matchedScreens = screenFiles.where((file) {
    final fileName = file.path.split('/').last;
    return fileName.contains('_page.dart') || fileName.contains('_screen.dart');
  }).toList();

  if (matchedScreens.isEmpty) {
    print('No matching screen files found.');
    return;
  }

  // Generate routes.dart file content
  StringBuffer routesContent = StringBuffer();

  routesContent.writeln("import 'package:flutter/material.dart';");

  for (var file in matchedScreens) {
    final fileName = file.path.split('/').last;
    final className = fileName.replaceAll('.dart', '').split('_').map((str) => str[0].toUpperCase() + str.substring(1)).join('');
    final importPath = '${screensFolderPath.replaceAll("\\", "/")}/$fileName';

    routesContent.writeln("import '../$importPath';");

    routesContent.writeln("""
Route<dynamic> generate${className}Route(RouteSettings settings) {
  switch (settings.name) {
    case '/${className.toLowerCase()}':
      return MaterialPageRoute(builder: (context) => $className());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for \${settings.name}')),
        ),
      );
  }
}
""");
  }

  // Write to the routes.dart file
  final routesFile = File('${routesFolder.path}/routes.dart');
  await routesFile.writeAsString(routesContent.toString());

  print('Routes file generated successfully.');
}
