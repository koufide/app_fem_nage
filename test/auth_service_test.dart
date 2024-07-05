import 'package:app_fem_nage/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("description", () async {
    final res = await AuthService().signIn("0709327626", "123456789");

    print("Body Response => $res");

    expect(res is Map<String, dynamic>, true);
  });
}
