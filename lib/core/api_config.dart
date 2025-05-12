

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


class AppApi {
  static const String loginRequest = '/auth/sign-in';
  static const String clockInOut = '/attendance/clock/in-out';
  static const String getLastAttendance = '/attendance/get-my-last-attendance';
  static const String getMe = '/auth/get-me';
  static const String selectBranch = '/select/branches';
  static const String selectDivisionLevel1 = '/select/get-list-division-level1';
  static const String selectDivisionLevel2 = '/select/get-list-division-level2';
  static const String selectDepartmentLevel1 = '/select/get-list-department-level1';
  static const String selectDepartmentLevel2 = '/select/get-list-department-level2';
  static const String selectDepartmentLevel3 = '/select/get-list-department-level3';
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

