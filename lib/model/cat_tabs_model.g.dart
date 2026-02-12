// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_tabs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatTabsModelImpl _$$CatTabsModelImplFromJson(Map<String, dynamic> json) =>
    _$CatTabsModelImpl(
      partnerId: json['partner_id'] as String? ?? "",
      code: json['category_code'] as String? ?? "",
      name: json['category_name'] as String? ?? "",
      icon: json['category_icon'] as String? ?? "",
      iconPath: json['icon_path'] as String? ?? "",
      level: (json['level'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$CatTabsModelImplToJson(_$CatTabsModelImpl instance) =>
    <String, dynamic>{
      'partner_id': instance.partnerId,
      'category_code': instance.code,
      'category_name': instance.name,
      'category_icon': instance.icon,
      'icon_path': instance.iconPath,
      'level': instance.level,
    };
