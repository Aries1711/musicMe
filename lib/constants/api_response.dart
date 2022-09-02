// ignore_for_file: constant_identifier_names

class ApiResponse<T> {
  final Status status;

  final T? data;

  final String? message;

  const ApiResponse({this.status = Status.INITIAL, this.message, this.data});

  ApiResponse.loading({this.status = Status.LOADING, this.message, this.data});

  ApiResponse.completed(this.data,
      {this.status = Status.COMPLETED, this.message});

  ApiResponse.error(this.message, {this.status = Status.ERROR, this.data});

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status {
  INITIAL,
  LOADING,
  COMPLETED,
  ERROR,
}
