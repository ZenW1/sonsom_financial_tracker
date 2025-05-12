import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sonsom_financial_tracker/common/widget/app_title_widget.dart';
import 'package:sonsom_financial_tracker/core/app_color.dart';
import 'package:sonsom_financial_tracker/features/budget/view/add_budgets_screen.dart';
import 'package:sonsom_financial_tracker/features/home/widget/home_card_component_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // random user photo
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: Image.network(
                            'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
                            fit: BoxFit.cover,
                            width: 200,
                          ).image,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sonsom Financial Tracker',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Welcome back, User',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Total Balance',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 12,
                    ),
              ),
              Text(
                r'$223,876',
                textScaler: TextScaler.linear(1.3),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: HomeCardComponentWidget(
                        title: 'Income',
                        value: r'$273,874',
                        textColor: AppColors.greenColor,
                        svgPath:
                            'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: HomeCardComponentWidget(
                        title: 'Expense',
                        value: r'$273,874',
                        textColor: AppColors.redColor,
                        svgPath:
                            'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              AppTitleWidget(text: 'Expense Charts'),
              const SizedBox(height: 16),
              // SfCartesianChart(series: <CartesianSeries>[

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Get.to(AddBudgetsScreen(),
           transition: Transition.downToUp
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
