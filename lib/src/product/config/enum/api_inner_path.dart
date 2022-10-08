enum ApiInnerPath {
  login('login'),
  signup('signup'),
  me('me');

  final String path;
  const ApiInnerPath(this.path);
}
