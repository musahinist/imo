import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/http/http_exception.dart';
import '../../data/model/task.dart';
import '../../domain/task_repostory.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskRepository taskRepository;
  TaskCubit(this.taskRepository) : super(const TaskState());
  void getAllTask() {
    emit(state.copyWith(status: TaskStatus.loading));
    taskRepository.getAllTask().then((tasks) {
      emit(state.copyWith(status: TaskStatus.loaded, tasks: tasks));
    }).catchError((error) {
      DataException.handleError(error);
      emit(state.copyWith(status: TaskStatus.failure));
    });
  }

  void onReorder(int oldIndex, int newIndex) {
    emit(state.copyWith(status: TaskStatus.loading));
    List<Task> tasks = state.copyWith().tasks;
    final task = tasks.removeAt(oldIndex);
    tasks.insert(newIndex, task);
    emit(state.copyWith(status: TaskStatus.loaded, tasks: tasks));
  }

  void setSelectedTask(Task task) {
    emit(state.copyWith(selectedTask: task));
  }
}
