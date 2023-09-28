import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../class/api/failures.dart';

Either<Failure, Map<String, dynamic>> checkApiResponse(
    http.Response response, Map<dynamic, dynamic> responsebody) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    if (responsebody['status'] == 'failure') {
      return left(
          ServerFailere.checkonErrormessage(responsebody['message'] ?? ''));
    } else if (responsebody['status'] == 'success' ||
        response.statusCode == 200) {
      return right(responsebody as Map<String, dynamic>);
    } else {
      return left(
          ServerFailere.checkonErrormessage(responsebody['message'] ?? ''));
    }
  } else {
    return Left(ServerFailere.checkonStatuscode(response.statusCode));
  }
}
