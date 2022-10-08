enum JsonKey {
  email('email'),
  password('password'),
  accessToken('access_token');

  final String key;
  const JsonKey(this.key);
}
