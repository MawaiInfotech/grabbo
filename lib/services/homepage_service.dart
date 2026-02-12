import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:grabbo/model/cat_tabs_model.dart';
import 'package:grabbo/model/partner_list_model.dart';
import '../error/api_error.dart';
import 'package:http/http.dart' as http;
import 'constant.dart';


class HomepageService{

  Future<List<CatTabsModel>> getTabsListData(String parentId) async {
    final url = '${root}categories/$parentId';
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      final responseBody = json.decode(response.body);
      if (responseBody['success'] == true) {
        final itemList = responseBody['data'] as List;
        return itemList.map((e) => CatTabsModel.fromJson(e)).toList();
      }
    } catch (e) {
      _handleError(e);
    }
    return [];
  }

  Future<List<PartnerListModel>> getPartnerListData() async {
    const url = '${root}parant-categories';
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      final responseBody = json.decode(response.body);
      if (responseBody['success'] == true) {
        final itemList = responseBody['data'] as List;
        return itemList.map((e) => PartnerListModel.fromJson(e)).toList();
      }
    } catch (e) {
      _handleError(e);
    }
    return [];
  }

  void _handleError(var e) {
    if (e is String) throw e;
    if (e is SocketException) throw ApiError.internet();
    if (e is TimeoutException) throw ApiError.timeOut();
    if (e is ApiError) throw e;
    throw ApiError.unKnown();
  }

}