import '/models/task.dart';
import 'package:riverpod/riverpod.dart';

class TaskService {
  final Ref container;
  final List<Task> _tasks = [];

  TaskService(this.container);

  void addTask(String title) {
    final newTask = Task(title);
    _tasks.add(newTask);
    print('Task "$title" has been added.');
  }

  void completeTask(String title) {
    final task = _tasks.firstWhere((task) => task.title == title);
    task.isCompleted = true;
    print('Task "$title" has been completed.');
  }

  void viewTasks() {
    if (_tasks.isEmpty) {
      print('No tasks available.');
    } else {
      print('Tasks:');
      for (var task in _tasks) {
        print(task);
      }
    }
  }

  List<Task> get tasks => _tasks;
}
