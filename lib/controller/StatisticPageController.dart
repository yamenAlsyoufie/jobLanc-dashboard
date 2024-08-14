import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/remote/StatisticBack.dart';

class StatisticPageController extends GetxController {
  StatusRequest? statusRequest;
  late String token, lang;
  SharedPrefrencesServices myServices = Get.find();
  Statisticback statisticback = new Statisticback(Get.put(Crud()));
  List<Map<String, dynamic>> freelancers = [], companies = [];
  List<Map<String, int>> statistics = [];
  Map companyOfThemonth = {};
  @override
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    lang ="en";
    await getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await statisticback.getStatistics(token, lang, {});
    statusRequest = handelingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print('Response data: ${response['data']}');

        // Extracting integers from maps in the response
        for (int i = 0;
            i < response['data']['freelancers_in_each_week'].length;
            i++)
          freelancers.add(response['data']['freelancers_in_each_week'][i]);
        for (int i = 0;
            i < response['data']['companies_in_each_week'].length;
            i++) companies.add(response['data']['companies_in_each_week'][i]);

        //companyOfThemonth.addAll(response['data']['company_with_most_jobs']);
      }
    }

    print(freelancers);

    statistics = [
      {
        "Total companies": response['data']['total_companies'],
      },
      {
        "Total freelancers": response['data']['total_freelancers'],
      },
      {
        "hired freelancers": response['data']['hired_freelancers'],
      },
      {
        "posted tasks": response['data']['posted_tasks'],
      },
      {
        "posted jobs": response['data']['posted_jobs'],
      }
    ];

    update();
  }
}
