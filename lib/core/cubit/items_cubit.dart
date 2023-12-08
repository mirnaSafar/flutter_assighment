import 'package:assignment_test/core/data/models/item_model.dart';
import 'package:assignment_test/core/data/reposotories/items_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitial());
  List<ItemModel> items = [];
  Future getAllItems() async {
    emit(FeatchingItemsProgress());
    await ItemsRepository().getAllItems().then(
        (value) => value.fold((l) => emit(ErrorFetchingItems(message: l)), (r) {
              if (r.isNotEmpty) {
                emit(ItemsFetchedSuccessfully());
                items = r;
              } else {
                emit(NoItemsYet());
              }
            }));
  }
}
