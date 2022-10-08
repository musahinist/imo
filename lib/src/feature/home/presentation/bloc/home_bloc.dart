import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:imo/src/feature/home/domain/task_repostory.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  TaskRepository taskRepository;
  HomeBloc(this.taskRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
  }
}
