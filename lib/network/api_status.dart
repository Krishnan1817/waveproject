class SuccessStatus {
  String responseStr;
  int status_code;
  SuccessStatus({required this.status_code, required this.responseStr});
}

class DownloadSuccessStatus {
  var responseBytes;
  int status_code;
  DownloadSuccessStatus({required this.status_code, required this.responseBytes});
}

class FailureStatus {
  String message;
  int status_code;
  String? responseStr;
  FailureStatus({required this.status_code, required this.message, this.responseStr});
}
