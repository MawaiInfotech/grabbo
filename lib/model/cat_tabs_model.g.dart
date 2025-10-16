// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_tabs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatTabsModelImpl _$$CatTabsModelImplFromJson(Map<String, dynamic> json) =>
    _$CatTabsModelImpl(
      code: json['category_code'] as String? ?? "",
      name: json['category_name'] as String? ?? "",
      icon: json['category_icon'] as String? ?? "",
    );

Map<String, dynamic> _$$CatTabsModelImplToJson(_$CatTabsModelImpl instance) =>
    <String, dynamic>{
      'category_code': instance.code,
      'category_name': instance.name,
      'category_icon': instance.icon,
    };
