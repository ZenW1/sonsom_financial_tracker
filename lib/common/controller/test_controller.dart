//
//
// import 'package:get/get.dart';
// import 'package:sonsom_financial_tracker/common/controller/base_controller.dart';
// import 'package:sonsom_financial_tracker/common/data/repository/test_repository.dart';
//
// import '../data/model/test_model.dart';
//
// class TestController extends GetxController with StateMixin<List<TestModel>> , BaseController {
//   final TestRepository testRepository = TestRepository();
//
//
//   Future<void> getTestData() async {
//     try {
//       change(null,status: RxStatus.loading());
//
//       final data = await testRepository.getTestData();
//
//       if(data.isEmpty){
//         change(null,status: RxStatus.empty());
//       } else {
//         change(data,status: RxStatus.success());
//       }
//     } catch (e){
//
//     }
//   }
// }