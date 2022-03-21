import '../data/model/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getAllTask();
  Future<Task> getTask();
  Future<Task> createTask(Task task);
  Future<Task> updateTask(Task task);
  Future<Task> deleteTask(Task task);
}
