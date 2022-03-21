import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/task.dart';
import '../cubit/task_cubit.dart';

class TaskDetailView extends StatelessWidget {
  const TaskDetailView({Key? key, required this.task}) : super(key: key);
  static const routeName = '/task-detail';
  final Task task;
  @override
  Widget build(BuildContext context) {
    return const _TaskDetailBody();
  }
}

class _TaskDetailBody extends StatelessWidget {
  const _TaskDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Task task = context.read<TaskCubit>().state.selectedTask!;
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title ?? ''),
      ),
      body: Center(
        child: Text(task.description ?? ''),
      ),
    );
  }
}
