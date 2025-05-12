//
// import 'api_config.dart';
// import 'app_storage.dart';
//
// mixin UserMixin {
//   AppStorage appStorage = AppStorage();
//
//   Future<String?> get accessToken => appStorage.read(key: ConstantPreferenceKey.accessTokenKey);
//
//   Future<String?> getAccessToken() async {
//     final token = await appStorage.read(key: ConstantPreferenceKey.accessTokenKey);
//     return token;
//   }
//
//   Future<String?> getRefreshToken() async {
//     final token = await appStorage.read(key: ConstantPreferenceKey.refreshTokenKey);
//     return token;
//   }
//
//   Future<void> writeToken(
//       {required String token, required String refreshToken, required String expireDuration}) async {
//     Future.wait([
//       appStorage.write(key: ConstantPreferenceKey.accessTokenKey, value: token),
//       appStorage.write(key: ConstantPreferenceKey.refreshTokenKey, value: refreshToken),
//       appStorage.write(key: ConstantPreferenceKey.expireDuration, value: expireDuration),
//     ]);
//   }
//
//   Future<void> clearToken() {
//     return appStorage.clearToken();
//   }
//
//   Future<int?> getExpireDuration() async {
//     final expireDuration = await appStorage.read(key: ConstantPreferenceKey.expireDuration);
//     int? expireIn = int.parse(expireDuration!);
//     return expireIn;
//   }
// }
