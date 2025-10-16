import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_tabs_model.g.dart';
part 'cat_tabs_model.freezed.dart';

@freezed
class CatTabsModel with _$CatTabsModel{
  const factory CatTabsModel({
    @JsonKey(name: "category_code") @Default("") String code,
    @JsonKey(name: "category_name") @Default("") String name,
    @JsonKey(name: "category_icon") @Default("") String icon,
  }) = _CatTabsModel;

  factory CatTabsModel.fromJson(Map<String, dynamic> json) => _$CatTabsModelFromJson(json);
}