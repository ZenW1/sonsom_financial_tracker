import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:logger/logger.dart';

import '../../core/api_config.dart';
import '../../core/environment.dart';

//singleton class for DioClient
class DioClient {
  // static final DioClient _instance = DioClient._internal();
  // late final  KK restApi ;


  // factory DioClient() => _instance;

  // DioClient._internal() {
  //   restApi = Swagger.create(
  //     baseUrl: Uri.parse(Environment.baseAPIUrl),
  //     httpClient: null,
  //     // authenticator: MyAuthenticator(),
  //     interceptors: [
  //       MyRequestInterceptor(),
  //       MyResponseInterceptor(),
  //     ],
  //   );
  // }
}

final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    printEmojis: true,
    colors: true,
  ),
);

class MyRequestInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async  {
    // final storage = getIt<AppStorage>();
    // final token = storage.read(key: ConstantPreferenceKey.accessTokenKey);
    //
    //  storage.clearWriteRequest();
    //  storage.clearWritePayload();

    final request = applyHeader(chain.request, 'authorization', 'Bearer ');

    // storage.writeRequest(url: request.uri.toString(), params: request.body.toString());

    // check it socket time out
    if(request.uri.toString().contains('socket')) {
      return chain.proceed(request);
    }


    logger.i('====================START====================');
    logger.i('HTTP method => ${request.method}');
    logger.i('Path => ${request.uri}');
    logger.i('Params  => ${request.parameters}');
    return chain.proceed(request);
  }
}

class MyResponseInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    // final storage = getIt<AppStorage>();
    // final token = storage.read(key: ConstantPreferenceKey.accessTokenKey);
    //
    // await storage.clearWritePayload();
    //

    final request = applyHeader(
      chain.request,
      'authorization',
      'Bearer ',
    );
    final response = await chain.proceed(request);

    // check if the socket time out

    if(request.uri.toString().contains('socket')) {
      return response;
    }

    // request path
    logger.d('Response => StatusCode: ${response.statusCode}'); // Debug log
    if (response.statusCode == 200) {
      logger.d('Response => Body: ${response.body}');
    } else {

      logger.d('Response => Response Error Data: ${response.error}');
    }
    return response;
  }
}

class HeaderInterceptor implements HeadersInterceptor {
  @override
  // TODO: implement headers
  Map<String, String> get headers => {
    "Content-Type": "application/json; charset=utf-8",
    "Accept": "application/json; charset=utf-8",
  };

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {

    return chain.proceed(chain.request);
  }

}

// class MyAuthenticator implements Authenticator {
//   @override
//   FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) {
//     final header = {
//       "Content-Type": "application/json; charset=utf-8",
//       "Accept": "application/json; charset=utf-8",
//       // "Authorization": "Bearer ${getIt<AppStorage>().read(key: ConstantPreferenceKey.accessTokenKey)}",
//     };
//
//     final modifiedRequest = applyHeaders(request, header);
//
//     // write
//
//     return modifiedRequest;
//   }
//
//   @override
//   // TODO: implement onAuthenticationFailed
//   AuthenticationCallback? get onAuthenticationFailed => throw UnimplementedError();
//
//   @override
//   AuthenticationCallback? get onAuthenticationSuccessful => throw UnimplementedError();
//
// }
