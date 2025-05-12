// // To parse this JSON data, do
// //
// //     final errorResponseModel = errorResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// ErrorResponseModel errorResponseModelFromJson(String str) => ErrorResponseModel.fromJson(json.decode(str));
//
// String errorResponseModelToJson(ErrorResponseModel data) => json.encode(data.toJson());
//
// class ErrorResponseModel {
//   String? messageKh;
//   String? messageEn;
//   bool? success;
//   int? statusCode;
//   String? data;
//   List<Error>? errors;
//   String? correlationId;
//
//   ErrorResponseModel({
//     this.messageKh,
//     this.messageEn,
//     this.success,
//     this.statusCode,
//     this.data,
//     this.errors,
//     this.correlationId,
//   });
//
//   factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => ErrorResponseModel(
//     messageKh: json["messageKh"],
//     messageEn: json["messageEn"],
//     success: json["success"],
//     statusCode: json["statusCode"],
//     data: json["data"],
//     errors: json["errors"] == null ? [] : List<Error>.from(json["errors"]!.map((x) => Error.fromJson(x))),
//     correlationId: json["correlationId"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "messageKh": messageKh,
//     "messageEn": messageEn,
//     "success": success,
//     "statusCode": statusCode,
//     "data": data,
//     "errors": errors == null ? [] : List<dynamic>.from(errors!.map((x) => x.toJson())),
//     "correlationId": correlationId,
//   };
// }
//
// class Error {
//   String? field;
//   List<ErrorMessage>? errorMessages;
//
//   Error({
//     this.field,
//     this.errorMessages,
//   });
//
//   factory Error.fromJson(Map<String, dynamic> json) => Error(
//     field: json["field"],
//     errorMessages: json["errorMessages"] == null ? [] : List<ErrorMessage>.from(json["errorMessages"]!.map((x) => ErrorMessage.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "field": field,
//     "errorMessages": errorMessages == null ? [] : List<dynamic>.from(errorMessages!.map((x) => x.toJson())),
//   };
// }
//
// class ErrorMessage {
//   String? enMessage;
//   String? khMessage;
//   String? errorCode;
//
//   ErrorMessage({
//     this.enMessage,
//     this.khMessage,
//     this.errorCode,
//   });
//
//   factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
//     enMessage: json["enMessage"],
//     khMessage: json["khMessage"],
//     errorCode: json["errorCode"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "enMessage": enMessage,
//     "khMessage": khMessage,
//     "errorCode": errorCode,
//   };
// }
