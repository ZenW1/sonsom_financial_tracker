import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/network/dio_client.dart';
import 'core/app_storage.dart';


final getIt = GetIt.instance;

class DependencyInjectionService{
  DependencyInjectionService._();

  static final DependencyInjectionService instance = DependencyInjectionService._();

  factory DependencyInjectionService() => instance;

  void initSetUp() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    // register repository global
    getIt.registerLazySingleton(() =>  DioClient());
    getIt.registerLazySingleton<AppStorage>(() => AppStorage(storage: sharedPreferences));


    print(GetIt.instance.allReady());


  }
}