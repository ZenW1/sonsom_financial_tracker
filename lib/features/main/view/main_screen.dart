import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sonsom_financial_tracker/features/home/view/home_screen.dart';
import 'package:sonsom_financial_tracker/features/statistics/view/statistics_screen.dart';

import '../../../common/controller/main_controller.dart';
import '../../../core/app_color.dart';
import '../../../core/dimensions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final _controller = Get.put(MainController());

  @override
  void initState() {
    _controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: mainScreen(
            index: _controller.currentTap.value,
          ),
          bottomNavigationBar: buildAnimatedContainer(context),
        );
      },
    );
  }

  Widget mainScreen({required int index}) {
    return IndexedStack(
      index: index,
      children: [
        const HomeScreen(),
        const StatisticsScreen(),
        HomeScreen(),
        HomeScreen(),
      ],
    );
  }

  Widget buildAnimatedContainer(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.005,
          ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _controller.homeModel.length,
          itemBuilder: (context, index) => _buildTabItem(context, index),
          separatorBuilder: (_, __) => const SizedBox(width: 16),
        ),
      ),
    );
  }

  Widget _buildTabItem(BuildContext context, int index) {
    final isSelected = _controller.currentTap.value == index;
    return InkWell(
      onTap: () => _controller.selectingTap(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIndicator(isSelected),
            _buildTabContent(index, isSelected),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator(bool isSelected) {
    return Container(
      height: 5,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimensions.radiusLarge()),
          bottomRight: Radius.circular(Dimensions.radiusLarge()),
        ),
        color: isSelected ? AppColors.primary : Colors.transparent,
      ),
    );
  }

  Widget _buildTabContent(int index, bool isSelected) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isSelected ? 44 : 0,
              width: 55,
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.radiusLarge()),
                  bottomRight: Radius.circular(Dimensions.radiusLarge()),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              SvgPicture.asset(
                _controller.homeModel[index].icon,
                color: isSelected ? AppColors.primary : AppColors.greyColor,
                width: 25,
                height: 25,
              ),
              const SizedBox(height: 16),
              Text(
                _controller.homeModel[index].title,
                style: TextStyle(
                  color: isSelected ? AppColors.primary : AppColors.greyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
