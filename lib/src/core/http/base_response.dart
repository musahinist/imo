class Res {
  Res({required this.ok, this.result});

  bool ok;
  dynamic result;

  factory Res.fromJson(Map<String, dynamic> json) => Res(
        ok: json['ok'] as bool,
        result: json['result'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'ok': ok,
        'result': result?.toJson(),
      };
}
