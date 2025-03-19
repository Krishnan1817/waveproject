import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_status.dart';

bool isToastVisible = false;

class ApiServices {
  final tokenService = '';
  // TokenDataService tokenDataService = TokenDataServiceImp();

  void showToastMsg() async {
    if (isToastVisible == false) {
      isToastVisible = true;
      // CommonToastWidget.toastMessage("Sorry, something went wrong!");

      await Future.delayed(Duration(seconds: 3), () {
        isToastVisible = false;
      });
    }
  }

  getService(String url) async {
    String token = '';
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };
    try {
      Uri uri = Uri.parse(url);

      var response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return SuccessStatus(status_code: 200, responseStr: response.body);
      } else if (response.statusCode == 401) {
        // await tokenService.getAccesstoken();

        return getService(url);
      } else if (response.statusCode == 502 ||
          response.statusCode == 500 ||
          response.statusCode == 100) {
        showToastMsg();
      }

      return FailureStatus(status_code: 100, message: "Invalid Response");
    } on HttpException {
      return FailureStatus(status_code: 101, message: "No Internet");
    } on FormatException {
      return FailureStatus(status_code: 100, message: "Invalid Format");
    } catch (e) {
      return FailureStatus(status_code: 100, message: "Unknown Error");
    }
  }

  postServicewithoutbody(String url) async {
    // String token = await tokenService.getAccesstoken();
    // int tenantId = await tokenService.getTenantId();

    try {
      Map<String, String> headers = {
        "Authorization": "Bearer ",
        "Abp-TenantId": ""
      };
      Uri uri = Uri.parse(url);

      var response = await http.post(uri, headers: headers);

      if (response.statusCode == 200) {
        return SuccessStatus(status_code: 200, responseStr: response.body);
      } else if (response.statusCode == 502 ||
          response.statusCode == 500 ||
          response.statusCode == 100) {
        showToastMsg();
      }

      return FailureStatus(status_code: 100, message: "Invalid Response");
    } on HttpException {
      return FailureStatus(status_code: 101, message: "No Internet");
    } on FormatException {
      return FailureStatus(status_code: 100, message: "Invalid Format");
    } catch (e) {
      return FailureStatus(status_code: 100, message: "Unknown Error");
    }
  }

  postService(String url, var body) async {
  
    try {
      Map<String, String> headers = {
   
      };
      Uri uri = Uri.parse(url);
      var request = jsonEncode(body);

      var response = await http.post(uri, headers: headers, body: request);
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        return SuccessStatus(status_code: 200, responseStr: response.body);
      } else if (response.statusCode == 502 ||
          response.statusCode == 500 ||
          response.statusCode == 100) {
        showToastMsg();
      }

      return FailureStatus(
          status_code: 100,
          message: "Invalid Response",
          responseStr: response.body);
    } on HttpException {
      return FailureStatus(status_code: 101, message: "No Internet");
    } on FormatException {
      return FailureStatus(status_code: 100, message: "Invalid Format");
    } catch (e) {
      return FailureStatus(status_code: 100, message: "Unknown Error");
    }
  }

  postServiceforApplytimesheet(String url, var body) async {
  
    try {
      Map<String, String> headers = {
  
      };
      Uri uri = Uri.parse(url);
      var request = jsonEncode(body);

      var response = await http.post(uri, headers: headers, body: request);
      debugPrint("${response.statusCode}");
      if (response.statusCode == 200) {
        return SuccessStatus(status_code: 200, responseStr: response.body);
      } else if (response.statusCode == 502 ||
          response.statusCode == 500 ||
          response.statusCode == 100) {
        showToastMsg();
      }

      return FailureStatus(
          status_code: 100,
          message: "Invalid Response",
          responseStr: response.body);
    } on HttpException {
      return FailureStatus(status_code: 101, message: "No Internet");
    } on FormatException {
      return FailureStatus(status_code: 100, message: "Invalid Format");
    } catch (e) {
      return FailureStatus(status_code: 100, message: "Unknown Error");
    }
  }

  putService(String url, Map body) async {
    try {
      Uri uri = Uri.parse(url);
      var response = await http.put(uri, body: jsonEncode(body));
      if (response.statusCode == 200) {
        return SuccessStatus(status_code: 200, responseStr: response.body);
      } else if (response.statusCode == 502 ||
          response.statusCode == 500 ||
          response.statusCode == 100) {
        showToastMsg();
      }

      return FailureStatus(status_code: 100, message: "Invalid Response");
    } on HttpException {
      return FailureStatus(status_code: 101, message: "No Internet");
    } on FormatException {
      return FailureStatus(status_code: 100, message: "Invalid Format");
    } catch (e) {
      return FailureStatus(status_code: 100, message: "Unknown Error");
    }
  }

  deleteService(
    String url,
  ) async {
    Map<String, String> headers = {
      "Authorization": "Bearer "
    };
    try {
      Uri uri = Uri.parse(url);
      var response = await http.delete(uri, headers: headers);
      if (response.statusCode == 200) {
        return SuccessStatus(status_code: 200, responseStr: response.body);
      } else if (response.statusCode == 401) {
      
        return deleteService(url);
      } else if (response.statusCode == 502 ||
          response.statusCode == 500 ||
          response.statusCode == 100) {
        showToastMsg();
      }

      return FailureStatus(status_code: 100, message: "Invalid Response");
    } on HttpException {
      return FailureStatus(status_code: 101, message: "No Internet");
    } on FormatException {
      return FailureStatus(status_code: 100, message: "Invalid Format");
    } catch (e) {
      return FailureStatus(status_code: 100, message: "Unknown Error");
    }
  }

  // fileUploadService(String url, String path, String name) async {
  //   String token = await tokenDataService.accessToken!;

  //   try {
  //     Map<String, String> headers = {
  //       "Authorization": "Bearer $token",
  //     };
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.headers.addAll(headers);
  //     request.files.add(await http.MultipartFile.fromPath(
  //       name,
  //       path,
  //     ));
  //     request.files.add(await http.MultipartFile.fromPath('file', path));
  //     var response = await request.send();
  //     if (response.statusCode == 200) {
  //       var responseString = await response.stream.bytesToString();
  //       return SuccessStatus(status_code: 200, responseStr: responseString);
  //     } else if (response.statusCode == 401) {
  //       fileUploadService(url, path, name);
  //     } else if (response.statusCode == 502 ||
  //         response.statusCode == 500 ||
  //         response.statusCode == 100) {
  //       showToastMsg();
  //     }

  //     return FailureStatus(status_code: 100, message: "Invalid Response");
  //   } on HttpException {
  //     return FailureStatus(status_code: 101, message: "No Internet");
  //   } on FormatException {
  //     return FailureStatus(status_code: 100, message: "Invalid Format");
  //   } catch (e) {
  //     return FailureStatus(status_code: 100, message: "Unknown Error");
  //   }
  // }

  // fileDownloadService(String url) async {
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       var responseBytes = await response.bodyBytes;
  //       return DownloadSuccessStatus(
  //           status_code: 200, responseBytes: responseBytes);
  //     } else if (response.statusCode == 502 ||
  //         response.statusCode == 500 ||
  //         response.statusCode == 100) {
  //       showToastMsg();
  //     }

  //     return FailureStatus(status_code: 100, message: "Invalid Response");
  //   } on HttpException {
  //     return FailureStatus(status_code: 101, message: "No Internet");
  //   } on FormatException {
  //     return FailureStatus(status_code: 100, message: "Invalid Format");
  //   } catch (e) {
  //     return FailureStatus(status_code: 100, message: "Unknown Error");
  //   }
  // }
}
