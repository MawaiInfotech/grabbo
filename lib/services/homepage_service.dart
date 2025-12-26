import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:grabbo/model/cat_tabs_model.dart';
import '../error/api_error.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';


class HomepageService{

  Future<List<CatTabsModel>> getTabsListData() async {
    const url = '${root}product/productCategory';
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      final responseBody = json.decode(response.body);
      print(responseBody);
      if (responseBody['status'] == true) {
        final itemList = responseBody['data'] as List;
        return itemList.map((e) => CatTabsModel.fromJson(e)).toList();
      }
    } catch (e) {
      _handleError(e);
    }
    return [];
  }

  _handleError(var e) {
    if (e is String) throw e;
    if (e is SocketException) throw ApiError.internet();
    if (e is TimeoutException) throw ApiError.timeOut();
    if (e is ApiError) throw e;
    throw ApiError.unKnown();
  }

}