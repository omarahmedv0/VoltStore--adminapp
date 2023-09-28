import 'package:dartz/dartz.dart';

import '../../../../../core/class/api/failures.dart';

abstract class LoginRepo {
  Future<Either<Failure, Map>> login(String password, String email);
}
