import 'package:app_fem_nage/models/session.dart';

abstract  class BackendService {
  Future<Session> signIn({required String mobile, required String password});
}