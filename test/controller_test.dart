
import 'package:flutter_mockito/controller.dart';
import 'package:flutter_mockito/repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockitoRepository extends Mock implements IGithubRepository {}
main(){
  MockitoRepository repository = MockitoRepository();
  Controller controller = Controller(repository);

  test('Buscando usuário `rairongf`', () async {
    when(repository.getUser('rairongf')).thenAnswer((realInvocation) => Future.value({'username': 'rairongf'}));
    await controller.getGithubUser('rairongf');
    expect(controller.data, {'username': 'rairongf'});
  });

  test('Buscando usuário `jacobaraujo7`', () async {
    when(repository.getUser('jacobaraujo7')).thenAnswer((realInvocation) => Future.value({'username': 'jacobaraujo7'}));
    await controller.getGithubUser('jacobaraujo7');
    expect(controller.data, {'username': 'jacobaraujo7'});
  });

  test('Buscando usuário `dart-lang`', () async {
    when(repository.getUser('dart-lang')).thenAnswer((realInvocation) => Future.value({'username': 'dart-lang'}));
    await controller.getGithubUser('dart-lang');
    expect(controller.data, {'username': 'dart-lang'});
  });
}