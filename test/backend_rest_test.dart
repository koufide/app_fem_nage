import 'package:app_fem_nage/models/session.dart';
import 'package:app_fem_nage/rest/backend_rest_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("Test backend rest login", () async {
      final res = await BackendRestService()
          .signIn(mobile: "+2250700000003",
          password: "123456789");

      print("Body Response => $res");

      expect(res is Session, true);
      // expect(res.user?.id, "71m4vndAh8usU7ib8yDK");
      // expect(res.user?.nom, "innocent");
      // expect(res.user?.email, "innocent@gmail.com");

  });

  test("Test backend rest login", () async {
    final res = await BackendRestService()
        .signIn(mobile: "+2250700000003AAA",
        password: "123456789AAA");

    print("Body Response => $res");

    expect(
         res,
      isNull,
    );
  });

}