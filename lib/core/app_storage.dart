
import 'package:shared_preferences/shared_preferences.dart';

import 'api_config.dart';

class AppStorage {
  AppStorage({
    required SharedPreferences storage,
  }) : _storage = storage;

  final SharedPreferences _storage;

  Future<void> write({required String key, required String value}) async {
    await _storage.setString(key, value);
  }

  // Future<void> writeUserInfo({required ResponseLoginResult data}) async {
  //   Future.wait([
  //     _storage.setString(ConstantPreferenceKey.accessTokenKey, data.data!.accessToken.toString()),
  //     _storage.setString(ConstantPreferenceKey.expireDuration, data.data!.expired.toString()),
  //     _storage.setBool(ConstantPreferenceKey.isManager, data.data!.isManager!),
  //     _storage.setString(ConstantPreferenceKey.userName,data.data!.fullNameKh!),
  //   ]);
  // }

  Future<void> writeRequest({required String url,required String params}) async {
    await _storage.setString(ConstantPreferenceKey.url, url);
    await _storage.setString(ConstantPreferenceKey.params, params);
  }

  Future<void> writePayload({required String payload}) async {
    await _storage.setString(ConstantPreferenceKey.payload, payload);
  }

  Future<void> clearWriteRequest() async {
    await _storage.remove(ConstantPreferenceKey.url);
    await _storage.remove(ConstantPreferenceKey.params);
  }

  Future<void> clearWritePayload() async {
    await _storage.remove(ConstantPreferenceKey.payload);
  }


  Object? read({required String key}) {
    final token = _storage.get(key);
    return token;
  }


   Future<void> clearToken() async {
    await _storage.clear();
  }
}
