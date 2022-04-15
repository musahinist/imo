import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<AppSettingState> {
  SettingCubit() : super(const AppSettingState());

  void changeTeam(int team) => emit(state.copyWith(team: team));

  void changeRound(int round) => emit(state.copyWith(round: round));

  void changeRoundTime(Duration roundTime) =>
      emit(state.copyWith(roundTime: roundTime));

  void changeBonus(bool bonus) => emit(state.copyWith(bonus: bonus));

  void changeHasSound(bool hasSound) =>
      emit(state.copyWith(hasSound: hasSound));

  void changeCanVibrate(bool canVibrate) =>
      emit(state.copyWith(canVibrate: canVibrate));
}
