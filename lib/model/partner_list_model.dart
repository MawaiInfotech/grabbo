import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_list_model.g.dart';
part 'partner_list_model.freezed.dart';

@freezed
class PartnerListModel with _$PartnerListModel{
  const factory PartnerListModel({
    @JsonKey(name: "partner_id") @Default("") String partnerId,
    @JsonKey(name: "partner_code") @Default("") String partnerCode,
    @JsonKey(name: "partner_name") @Default("") String partnerName,
    @JsonKey(name: "partner_type") @Default("") String partnerType,
    @JsonKey(name: "display_seq") @Default(0) int displaySeq,
    @JsonKey(name: "partner_logo") @Default("") String partnerLogo,
    @JsonKey(name: "icon_path") @Default("") String iconPath,
  }) = _PartnerListModel;

  factory PartnerListModel.fromJson(Map<String, dynamic> json) => _$PartnerListModelFromJson(json);
}