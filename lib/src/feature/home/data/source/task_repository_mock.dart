import '../../domain/task_repostory.dart';
import '../model/task.dart';

class TaskRepositoryMock implements TaskRepository {
  @override
  Future<Task> createTask(Task task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Task> deleteTask(Task task) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTask() async {
    return [
      Task(
        id: '1',
        title: 'Task 1',
        description: 'Task 1 description',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
      Task(
        id: '2',
        title: 'Task 2',
        description: 'Task 2 description',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
      Task(
        id: '3',
        title: 'Task 3',
        description: 'Task 3 description',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
      Task(
        id: '4',
        title: 'Task 4',
        description: 'Task 4 description',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
      Task(
        id: '5',
        title: 'Task 5',
        description: 'Task 5 description',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
      Task(
        id: '6',
        title: 'Task 6',
        description: 'Task 6 description',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
    ];
  }

  @override
  Future<Task> getTask() {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<Task> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
