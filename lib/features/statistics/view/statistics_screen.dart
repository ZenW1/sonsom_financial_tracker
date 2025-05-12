import 'package:flutter/material.dart';
import 'package:sonsom_financial_tracker/features/statistics/view/all_view_screen.dart';
import 'package:sonsom_financial_tracker/features/statistics/view/expense_view_screen.dart';

import '../../../core/app_color.dart';
import 'income_view_screen.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  Tab tabBarItem({required String title, required int index}) {
    return Tab(
      child: Container(
        height: 25,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.secondaryColor,
          ),
        )),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Statistics'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TabBar(
                  onTap: (integer) {
                    setState(() {
                      _controller.index = integer;
                    });
                  },
                  controller: _controller,
                  tabAlignment: TabAlignment.fill,
                  dividerColor: Colors.transparent,
                  indicatorColor: AppColors.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  padding: EdgeInsets.all(5),
                  indicatorWeight: 1,
                  splashFactory: NoSplash.splashFactory,
                  labelColor: Colors.black,
                  tabs: [
                    tabBarItem(title: 'All', index: 0),
                    tabBarItem(title: 'Income', index: 1),
                    tabBarItem(title: 'Expense', index: 2),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              child: TabBarView(
                controller: _controller,
                children: [
                  AllViewScreen(),
                  IncomeViewScreen(),
                  ExpenseViewScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
