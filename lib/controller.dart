
import 'package:flutter_mockito/repository.dart';

class Controller {
  final IGithubRepository _repository;
  Controller(this._repository);

  Map<String, dynamic> data = {};

  Future<void> getGithubUser(String username) async {
    data = await _repository.getUser(username);
  }
}