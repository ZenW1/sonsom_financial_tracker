

import 'app_storage.dart';

class ApiConfig {
  ApiConfig._();

  static String token = '';
  static const Duration receiveTimeout = Duration(milliseconds: 15000);
  static const Duration connectionTimeout = Duration(milliseconds: 15000);
  static Map<String,String> header() {
    if(token.isNotEmpty) {
      return {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json; charset=utf-8",
        "Accept": "application/json; charset=utf-8",
      };
    }else {
      return {
        "Content-Type": "application/json; charset=utf-8",
        "Accept": "application/json; charset=utf-8",
      };
    }
  }
}

class AppCollectionKey {
  static String user = "user";
  static String budget = "budget";
  static String income = "income";
  static String expense = "expense";
}

class ConstantPreferenceKey {
  static String accessTokenKey = 'accessTokenKey';
  static String refreshTokenKey = 'refreshTokenKey';
  static String userIdKey = 'userIdKey';
  static String isManager = 'userType';
  static String expireInKey = 'expireInKey';
  static String userTypeKey = 'userTypeKey';
  static String expireDuration = 'expireDuration';
  static String languageKey = 'languageKey';
  static String userName = 'userName';

  // this is for qa testing only
  static String url = 'url';
  static String params = 'params';
  static String payload = 'payload';
}

class AppConstantName {
  static String clockOut = 'CLOCK-OUT';
  static String clockIn = 'CLOCK-IN';
  static String leaveEarly = 'Leave Early';
  static String late = 'Late';
}

enum AttendanceStatus{
  late,
  present,
  absent,
}


enum UserType { manager,employee}

