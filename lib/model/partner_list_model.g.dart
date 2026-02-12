// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartnerListModelImpl _$$PartnerListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PartnerListModelImpl(
      partnerId: json['partner_id'] as String? ?? "",
      partnerCode: json['partner_code'] as String? ?? "",
      partnerName: json['partner_name'] as String? ?? "",
      partnerType: json['partner_type'] as String? ?? "",
      displaySeq: (json['display_seq'] as num?)?.toInt() ?? 0,
      partnerLogo: json['partner_logo'] as String? ?? "",
      iconPath: json['icon_path'] as String? ?? "",
    );

Map<String, dynamic> _$$PartnerListModelImplToJson(
        _$PartnerListModelImpl instance) =>
    <String, dynamic>{
      'partner_id': instance.partnerId,
      'partner_code': instance.partnerCode,
      'partner_name': instance.partnerName,
      'partner_type': instance.partnerType,
      'display_seq': instance.displaySeq,
      'partner_logo': instance.partnerLogo,
      'icon_path': instance.iconPath,
    };
