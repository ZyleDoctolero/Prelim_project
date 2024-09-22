class Task {
  String title;
  bool isCompleted;

  Task(this.title, {this.isCompleted = false});

  @override
  String toString() => '$title [${isCompleted ? 'Completed' : 'Pending'}]';
}
