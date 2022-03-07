abstract class AuthRepository {
  Future<String> login(String email, String pass);
  Future<String> signUp(String email, String pass);
  Future signOut();
}
