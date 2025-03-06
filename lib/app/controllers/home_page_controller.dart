import 'package:get/get.dart';
import '/app/data/model/school_model.dart';
import '/app/data/remote/home_page_data.dart';
import '/core/functions/handling_transaction.dart';

class HomePageController extends GetxController {
  //
  SchoolModel? school;

  // onInit() {
  //   //
  //   // school =
  //   super.onInit();
  // }

  indertData() async {
    var res = await HomePageData.insertData(SchoolModel(
      id: 1,
      name: "Greenwood International School",
      description: "A top-tier institution offering world-class education.",
      logoUri: "https://example.com/logos/greenwood.png",
      gov: "New York State Education Department",
      ministry: "Ministry of Education - USA",
      email: "info@greenwood.edu",
      status: true,
      createdAt: DateTime(2023, 5, 10, 8, 30),
      updatedAt: DateTime(2024, 2, 15, 14, 45),
    ).toMap());
    if (handlingTransaction(res)) {
      if (res.data != null) {
        school = SchoolModel.fromMap(res.data ?? {});
      }
    }
    update();
  }

  void fetchData() async {
    var res = await HomePageData.getData();
    if (handlingTransaction(res)) {
      if (res.data != null) {
        school = SchoolModel.fromMap(res.data!);
      }
    }
    update();
  }

  void deleteData() async {
    // int res = await homePageData.deleteData();
    // if (res > 0) {
    //   school = null;
    // }
    update();
  }
}
