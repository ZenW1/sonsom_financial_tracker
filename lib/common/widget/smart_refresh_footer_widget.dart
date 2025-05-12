
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../core/app_color.dart';

class SmartRefreshFooterWidget extends StatelessWidget {
  const SmartRefreshFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  ClassicFooter(
      loadStyle: LoadStyle.ShowWhenLoading,
      noDataText: 'មិនមានទិន្នន័យថ្មីទេ',
      loadingText: 'កំពុងទទួលទិន្នន័យ...',
      failedText: 'បរាជ័យក្នុងការទទួលទិន្នន័យ',
      idleText: 'រង់ចាំទិន្នន័យថ្មី...',
      loadingIcon: CircularProgressIndicator.adaptive(),
      canLoadingIcon: CircularProgressIndicator.adaptive(),
      idleIcon: CircularProgressIndicator.adaptive(
        backgroundColor: AppColors.primary,
      ),
      completeDuration: Duration(milliseconds: 500),
    ) ;
  }
}

class SmartRefreshHeaderWidget extends StatelessWidget {
  const SmartRefreshHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialClassicHeader(
      semanticsLabel: 'កំពុងទាញទិន្នន័យឡើងវិញ...',
      color: AppColors.primary,
      semanticsValue: 'កំពុងទាញទិន្នន័យឡើងវិញ...',
      distance: 50,
      offset: 50,
    );
  }
}

extension SmartRefreshExtension on RefreshController {
  void onLoading(VoidCallback loadPagination){
    loadPagination();
    loadComplete();
  }

  void onRefresh(VoidCallback callback){
    resetNoData();
    callback();
    refreshCompleted();
  }
}


