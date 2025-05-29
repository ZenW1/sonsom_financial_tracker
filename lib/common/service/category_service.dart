

import 'dart:ui';

import '../data/model/category_content_model.dart';

class CategoryService {
  List<CategoryContentModel> listCategory = [
    CategoryContentModel(
      title: "Chart",
      svgPath: "assets/svg/category-svg/bar-chart.svg",
      itemColor: Color(0xFF6C63FF), // Soft Indigo
    ),
    CategoryContentModel(
      title: "Foods",
      svgPath: "assets/svg/category-svg/foods.svg",
      itemColor: Color(0xFFFFB86F), // Peach Orange
    ),
    CategoryContentModel(
      title: "Study",
      svgPath: "assets/svg/category-svg/graduation-cap.svg",
      itemColor: Color(0xFF00BFA6), // Mint Green
    ),
    CategoryContentModel(
      title: "Gym",
      svgPath: "assets/svg/category-svg/gym.svg",
      itemColor: Color(0xFFFF5C8A), // Neon Coral
    ),
    CategoryContentModel(
      title: "Home",
      svgPath: "assets/svg/category-svg/home.svg",
      itemColor: Color(0xFF89DCEB), // Soft Sky Blue
    ),
    CategoryContentModel(
      title: "Pets",
      svgPath: "assets/svg/category-svg/pets.svg",
      itemColor: Color(0xFFFFAACC), // Light Pink
    ),
    CategoryContentModel(
      title: "Profile",
      svgPath: "assets/svg/category-svg/profile.svg",
      itemColor: Color(0xFF9E9DFF), // Lavender Blue
    ),
    CategoryContentModel(
      title: "Yoga",
      svgPath: "assets/svg/category-svg/yoga.svg",
      itemColor: Color(0xFFB4FFB0), // Soft Lime Green
    ),
    CategoryContentModel(
      title: "Saving",
      svgPath: "assets/svg/category-svg/saving.svg",
      itemColor: Color(0xFF00C2A8), // Teal Green
    ),
    CategoryContentModel(
      title: "Wallet",
      svgPath: "assets/svg/category-svg/wallet.svg",
      itemColor: Color(0xFFDDACF5), // Light Lilac
    ),
  ];
}