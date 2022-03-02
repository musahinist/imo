class LinkInfo {
  LinkInfo({
    this.code,
    this.url,
    this.passwordProtected,
    this.blocked,
    this.created,
  });

  String? code;
  String? url;
  bool? passwordProtected;
  bool? blocked;
  String? created;

  factory LinkInfo.fromJson(Map<String, dynamic> json) => LinkInfo(
        code: json['code'] as String?,
        url: json['url'] as String?,
        passwordProtected: json['password_protected'] as bool?,
        blocked: json['blocked'] as bool?,
        created: json['created'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'url': url,
        'password_protected': passwordProtected,
        'blocked': blocked,
        'created': created,
      };

  LinkInfo copyWith({
    String? code,
    String? url,
    bool? passwordProtected,
    bool? blocked,
    String? created,
  }) {
    return LinkInfo(
      code: code ?? this.code,
      url: url ?? this.url,
      passwordProtected: passwordProtected ?? this.passwordProtected,
      blocked: blocked ?? this.blocked,
      created: created ?? this.created,
    );
  }
}
