import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sonsom_financial_tracker/common/controller/expense_controller.dart';
import 'package:sonsom_financial_tracker/common/widget/app_title_widget.dart';
import 'package:sonsom_financial_tracker/core/app_color.dart';
import 'package:sonsom_financial_tracker/core/date_format_extension.dart';
import 'package:sonsom_financial_tracker/core/dimensions.dart';
import 'package:sonsom_financial_tracker/features/budget/view/add_income_screen.dart';
import 'package:sonsom_financial_tracker/features/budget/view/add_expense_screen.dart';
import 'package:sonsom_financial_tracker/features/home/widget/home_card_component_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(ExpenseController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getExpenseData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                SizedBox(
                  height: 16,
                ),
                AppTitleWidget(text: 'Recent Transactions'),
                const SizedBox(height: 16),
                controller.obx(
                    onLoading: Center(
                      child: CircularProgressIndicator(),
                    ),
                    onEmpty: Center(
                      child: Text('No data'),
                    ), (state) {
                  return ListView.separated(
                    itemCount: state?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SlideToDeleteItem(
                        key: Key("$index"),
                        onDelete: () async {
                          controller.deleteExpenseRecord(id: state?[index].id ?? "");
                          await controller.getExpenseData();
                        },
                        child: AppTransactionContentWidget(
                          svgPath: state?[index].svgPath ?? "",
                          title: state?[index].note ?? "",
                          subTitle: state?[index].category ?? "",
                          value: state?[index].amount.toString() ?? "",
                          date: state?[index].date ?? "",
                          valueColor: AppColors.redColor,
                          svgColor: Color(int.parse('0xFF${state?[index].svgColor}')),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return SizedBox(
                        height: Dimensions.paddingSizeDefault(),
                      );
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AnimatedFabMenu(),
    );
  }
}

class ExpandableFabExample extends StatefulWidget {
  @override
  _ExpandableFabExampleState createState() => _ExpandableFabExampleState();
}

class _ExpandableFabExampleState extends State<ExpandableFabExample> with SingleTickerProviderStateMixin {
  bool _isOpen = false;

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // First menu FAB
        if (_isOpen)
          Padding(
            padding: const EdgeInsets.only(bottom: 140.0),
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: 'menu1',
              mini: true,
              onPressed: () {
                print('Menu 1 clicked');
              },
              child: Icon(Icons.edit),
            ),
          ),
        // Second menu FAB
        if (_isOpen)
          Padding(
            padding: const EdgeInsets.only(bottom: 70.0),
            child: FloatingActionButton(
              shape: CircleBorder(),
              heroTag: 'menu2',
              mini: true,
              onPressed: () {
                print('Menu 2 clicked');
              },
              child: Icon(Icons.money_off_csred_outlined),
            ),
          ),
        // Main FAB

        FloatingActionButton(
          heroTag: 'main',
          shape: CircleBorder(),
          onPressed: _toggle,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: Icon(
              _isOpen ? Icons.close : Icons.add,
              key: ValueKey<bool>(_isOpen),
            ),
          ),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(home: AnimatedFabMenu()));

class AnimatedFabMenu extends StatefulWidget {
  @override
  _AnimatedFabMenuState createState() => _AnimatedFabMenuState();
}

class _AnimatedFabMenuState extends State<AnimatedFabMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _offset1;
  late Animation<Offset> _offset2;

  bool _isOpen = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 0.75).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _offset1 = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _offset2 = Tween<Offset>(begin: Offset(0, 2), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildMiniFab(
      {required IconData icon,
      required VoidCallback onPressed,
      required Animation<Offset> offset,
      required String tag}) {
    return SlideTransition(
      position: offset,
      child: FadeTransition(
        opacity: _controller,
        child: FloatingActionButton(
          heroTag: tag,
          shape: CircleBorder(),
          mini: true,
          onPressed: onPressed,
          child: Icon(icon),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isOpen)
          _buildMiniFab(
            icon: Icons.wallet,
            onPressed: () => Get.to(
              () => AddIncomeScreen(),
            ),
            offset: _offset2,
            tag: 'edit',
          ),
        SizedBox(height: 10),
        if (_isOpen)
          _buildMiniFab(
            icon: Icons.money_off_csred_outlined,
            onPressed: () => Get.to(()=> AddExpenseScreen()),
            offset: _offset1,
            tag: 'camera',
          ),
        SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'main',
          shape: CircleBorder(),
          onPressed: _toggle,
          child: AnimatedRotation(
            duration: Duration(milliseconds: 300),
            turns: _rotationAnimation.value,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

//
// class SlideToDeleteItem extends StatefulWidget {
//   final Widget child;
//   final VoidCallback onDelete;
//   final Key key;
//
//   SlideToDeleteItem({
//     required this.key,
//     required this.child,
//     required this.onDelete,
//   }) : super(key: key);
//
//   @override
//   State<SlideToDeleteItem> createState() => _SlideToDeleteItemState();
// }
//
// class _SlideToDeleteItemState extends State<SlideToDeleteItem>
//     with SingleTickerProviderStateMixin {
//   bool _isDeleted = false;
//   late AnimationController _controller;
//   late Animation<double> _heightFactor;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _heightFactor = _controller.drive(CurveTween(curve: Curves.easeInOut));
//   }
//
//   void _handleDelete(BuildContext context) {
//     setState(() {
//       _isDeleted = true;
//     });
//     _controller.forward().then((_) {
//       widget.onDelete();
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Item deleted'),
//           action: SnackBarAction(
//             label: 'UNDO',
//             onPressed: () {
//               setState(() {
//                 _isDeleted = false;
//               });
//               _controller.reverse();
//             },
//           ),
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizeTransition(
//       sizeFactor: _heightFactor,
//       axisAlignment: 0.0,
//       child: Dismissible(
//         key: widget.key,
//         direction: DismissDirection.endToStart,
//         confirmDismiss: (_) async {
//           _handleDelete(context);
//           return false;
//         },
//         background: Container(
//           alignment: Alignment.centerRight,
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           color: Colors.redAccent,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Icon(Icons.delete_forever, color: Colors.white, size: 28),
//               SizedBox(width: 8),
//               Text("Delete",
//                   style: TextStyle(color: Colors.white, fontSize: 16)),
//             ],
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
//           child: widget.child,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

class AppTransactionContentWidget extends StatelessWidget {
  const AppTransactionContentWidget(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.subTitle,
      required this.value,
      required this.date,
      required this.valueColor,
      required this.svgColor});

  final String svgPath;
  final String title;
  final String subTitle;
  final String value;
  final String date;
  final Color valueColor;
  final Color svgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  svgPath,
                  color: svgColor,
                  width: 30,
                  height: 30,
                ),
                SizedBox(
                  width: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "-${value}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: valueColor,
                        fontSize: 18,
                      ),
                ),
                Text(
                  date.fromDateTimeToString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.greyColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SlideToDeleteItem extends StatelessWidget {
  final Widget child;
  final Function onDelete;
  final Key key;

  SlideToDeleteItem({
    required this.key,
    required this.child,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDelete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Item deleted')),
        );
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: child,
      ),
    );
  }
}
