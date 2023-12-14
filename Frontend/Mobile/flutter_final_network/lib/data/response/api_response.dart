import 'status.dart';

class ApiResponse<T> {

  Status? status;
  T? data;
  String? message;


  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.complete() : status = Status.COMPLETE;
  ApiResponse.error() : status = Status.ERROR;


  @override
   String toString() {
    return "{ Status :$status || Message :$message || Data :$data}";
  }
  
}