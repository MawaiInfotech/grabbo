import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabbo/services/homepage_service.dart';
import 'package:grabbo/state/cat_tabs_state.dart';
import '../error/api_error.dart';


class CatTabsBloc extends Cubit<CatTabsState>{
  CatTabsBloc(this.homepageService) : super(CatTabsState.initial());

  final HomepageService homepageService;

  Future<void> init()async {
    emit(CatTabsState.loading(state.catTabsModel));
    try {
      final tabsData = await homepageService.getTabsListData();
      emit(CatTabsState.content(tabsData));
    } on ApiError catch (error) {
      emit(CatTabsState.failed(state.catTabsModel, error.message));
    }
  }
}