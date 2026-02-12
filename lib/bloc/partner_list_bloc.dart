import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabbo/services/homepage_service.dart';
import 'package:grabbo/state/partner_list_state.dart';
import '../error/api_error.dart';


class PartnerListBloc extends Cubit<PartnerListState>{
  PartnerListBloc(this.homepageService) : super(PartnerListState.initial());

  final HomepageService homepageService;

  Future<void> init()async {
    emit(PartnerListState.loading(state.partnerListState));
    try {
      final partnerList = await homepageService.getPartnerListData();
      emit(PartnerListState.content(partnerList));
    } on ApiError catch (error) {
      emit(PartnerListState.failed(state.partnerListState, error.message));
    }
  }
}