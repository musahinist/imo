part of 'task_cubit.dart';

enum TaskStatus { initial, loading, loaded, failure }

@immutable
class TaskState extends Equatable {
  final TaskStatus status;
  final List<Task> tasks;
  final Task? selectedTask;
  const TaskState(
      {this.status = TaskStatus.initial,
      this.tasks = const [],
      this.selectedTask});

  @override
  List<Object?> get props => [status, tasks, selectedTask];

  TaskState copyWith({
    TaskStatus? status,
    List<Task>? tasks,
    Task? selectedTask,
  }) {
    return TaskState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      selectedTask: selectedTask ?? this.selectedTask,
    );
  }
}
