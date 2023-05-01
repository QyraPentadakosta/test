import 'package:base_bloc/domain/repository/user/entity/user_entity.dart';
import 'package:base_bloc/pages/login/services/services_login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockExampleServices extends Mock implements LoginServices {}

Future<void> main() async {
  late LoginServices loginServices;

  setUp(() {
    loginServices = MockExampleServices();
  });

  group('Login Test', () {
    testWidgets('Login Success', (tester) async {
      String email = '';
      String password = '';

      when(() => loginServices.login(email, password))
          .thenAnswer((_) => Future.value(
                UserEntity(
                  email: 'email',
                  password: 'password',
                  userName: 'userName',
                  id: 1,
                ),
              ));
      var response = await loginServices.login(email, password);

      expect(response, isNotNull);
    });

    testWidgets('Login Error', (widgetTester) async {
      String email = '';
      String password = '';
      when(() => loginServices.login(email, password))
          .thenAnswer((_) => Future.value(null));
      var response = await loginServices.login(email, password);
      expect(response, isNull);
    });
  });
}
