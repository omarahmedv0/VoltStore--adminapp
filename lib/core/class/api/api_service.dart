// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:adminapp/core/class/api/api_errors.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../../functions/check_api_response.dart';
import '../../functions/check_internet.dart';
import 'failures.dart';

class ApiService {
  Client client;
  Map<String, String>? headers;
  ApiService({
    required this.client,
  });
  Future<Either<Failure, Map<String, dynamic>>> getData(
    String link,
  ) async {
    try {
      if (await checkInternet() == true) {
        var response = await client.get(
          Uri.parse(link),
        );
        Map responsebody = jsonDecode(response.body);
        return checkApiResponse(response, responsebody);
      } else {
        return Left(ServerFailere(
          'No Internet',
          ApiErrors.offlinefailure,
        ));
      }
    } on ServerFailere catch (e) {
      return Left(ServerFailere(
        e.errMessage,
        ApiErrors.failure,
      ));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> postData(String link, Map data,
      {headers}) async {
    try {
      if (await checkInternet() == true) {
        var response = await client.post(
          Uri.parse(link),
          body: data,
          headers: headers,
        );
        print(response.body);
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        return checkApiResponse(response, responsebody);
      } else {  
        return Left(ServerFailere(
          'No Internet',
          ApiErrors.offlinefailure,
        ));
      }
    } on ServerFailere catch (e) {
      return Left(ServerFailere(
        e.errMessage,
        ApiErrors.failure,
      ));
    }
  }

  Future<Either<Failure, Map>> postwithSingleImage(url, data, File? image,
      {String? namerequest}) async {
    namerequest ??= "file";

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return Left(ServerFailere(response.body, ApiErrors.failure));
    }
  }
}
