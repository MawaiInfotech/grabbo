import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grabbo/model/cat_tabs_model.dart';


part 'cat_tabs_state.freezed.dart';

@freezed
class CatTabsState with _$CatTabsState {
  const factory CatTabsState.loading(List<CatTabsModel> catTabsModel) =_Loading;
  const factory CatTabsState.content(List<CatTabsModel> catTabsModel) =_Content;
  const factory CatTabsState.success(List<CatTabsModel> catTabsModel) =_Success;
  const factory CatTabsState.failed(List< CatTabsModel> catTabsModel, message) = _Failed;

  factory CatTabsState.initial() => const CatTabsState.content([]);
}
