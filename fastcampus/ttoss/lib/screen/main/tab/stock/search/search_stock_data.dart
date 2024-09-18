import 'package:fast_app_base/common/util/local_json.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';
import 'package:get/get.dart';

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  RxList<String> searchHistrotyList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistrotyList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    loadLocalStockJson();


    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList = await LocalJson.getObjectList<SimpleStock>("json/stock_list.json");
    stocks.addAll(jsonList);
  }
}