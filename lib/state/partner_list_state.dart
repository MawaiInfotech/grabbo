import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grabbo/model/partner_list_model.dart';



part 'partner_list_state.freezed.dart';

@freezed
class PartnerListState with _$PartnerListState {
  const factory PartnerListState.loading(List<PartnerListModel> partnerListState) =_Loading;
  const factory PartnerListState.content(List<PartnerListModel> partnerListState) =_Content;
  const factory PartnerListState.success(List<PartnerListModel> partnerListState) =_Success;
  const factory PartnerListState.failed(List< PartnerListModel> partnerListState, message) = _Failed;

  factory PartnerListState.initial() => const PartnerListState.content([]);
}
