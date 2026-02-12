import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_tabs_model.g.dart';
part 'cat_tabs_model.freezed.dart';

@freezed
class CatTabsModel with _$CatTabsModel{
  const factory CatTabsModel({
    @JsonKey(name: "partner_id") @Default("") String partnerId,
    @JsonKey(name: "category_code") @Default("") String code,
    @JsonKey(name: "category_name") @Default("") String name,
    @JsonKey(name: "category_icon") @Default("") String icon,
    @JsonKey(name: "icon_path") @Default("") String iconPath,
    @JsonKey(name: "level") @Default(0) int level,
  }) = _CatTabsModel;

  factory CatTabsModel.fromJson(Map<String, dynamic> json) => _$CatTabsModelFromJson(json);
}