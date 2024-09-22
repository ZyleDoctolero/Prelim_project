import 'dart:io';
import 'package:zyle/services/global_providers.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  final container = ProviderContainer();
  final taskService = container.read(taskServiceProvider);

  while (true) {
    print('\nTask Manager');
    print('1. Add a task');
    print('2. Complete a task');
    print('3. View all tasks');
    print('4. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter the task title:');
        String? title = stdin.readLineSync();
        if (title != null && title.isNotEmpty) {
          taskService.addTask(title);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '2':
        print('Enter the task title to complete:');
        String? title = stdin.readLineSync();
        if (title != null && title.isNotEmpty) {
          taskService.completeTask(title);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '3':
        taskService.viewTasks();
        break;
      case '4':
        print('Exiting the application...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
