part of 'setting_cubit.dart';

class AppSettingState extends Equatable {
  final int team;
  final int round;
  final Duration roundTime;
  final bool bonus;
  final bool hasSound;
  final bool canVibrate;

  const AppSettingState({
    this.team = 2,
    this.round = 3,
    this.roundTime = const Duration(seconds: 60),
    this.bonus = true,
    this.hasSound = true,
    this.canVibrate = true,
  });

  AppSettingState copyWith({
    int? team,
    int? round,
    Duration? roundTime,
    bool? bonus,
    bool? hasSound,
    bool? canVibrate,
  }) {
    return AppSettingState(
      team: team ?? this.team,
      round: round ?? this.round,
      roundTime: roundTime ?? this.roundTime,
      bonus: bonus ?? this.bonus,
      hasSound: hasSound ?? this.hasSound,
      canVibrate: canVibrate ?? this.canVibrate,
    );
  }

  @override
  String toString() {
    return 'AppSettingState(team: $team, round: $round, roundTime: $roundTime, bonus: $bonus, hasSound: $hasSound, canVibrate: $canVibrate)';
  }

  @override
  List<Object?> get props =>
      [team, round, roundTime, bonus, hasSound, canVibrate];
}
