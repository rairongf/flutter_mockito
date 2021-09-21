abstract class IGithubRepository {
  Future<Map<String, dynamic>> getUser(String username);
}