import 'package:assignment_test/core/data/reposotories/items_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'item_details_state.dart';

class ItemDetailsCubit extends Cubit<ItemDetailsState> {
  ItemDetailsCubit() : super(ItemDetailsInitial());
  Map<String, dynamic>? itemDetails;
  Future getItemDetails(int id) async {
    emit(FeatchingItemdetailsProgress());
    await ItemsRepository().getItemDetails(id).then((value) =>
        value.fold((l) => emit(ErrorFetchingItemdetails(message: l)), (r) {
          emit(ItemdetailsFetchedSuccessfully());
          itemDetails = r;
        }));
  }
}
