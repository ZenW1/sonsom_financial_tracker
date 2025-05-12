

import 'package:get/get.dart';

import '../../core/api_config.dart';

class MainController extends GetxController {



  List<HomeModel> homeModel = [
    HomeModel(title: 'Home', icon: 'assets/svg/home.svg'),
    HomeModel(title: 'Stats', icon: 'assets/svg/statistic.svg'),
    HomeModel(title: 'Wallet', icon: 'assets/svg/wallet.svg'),

    HomeModel(title: 'Profile', icon: 'assets/svg/profile.svg'),
  ];

  late RxInt currentTap = 0.obs;

  void selectingTap(int index){
    currentTap.value = index;
  }

  void init(){
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }

}

class HomeModel {
  final String title;
  final String icon;

  HomeModel({
    required this.title,
    required this.icon,
  });
}
