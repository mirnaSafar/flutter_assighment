part of 'item_details_cubit.dart';

@immutable
class ItemDetailsState {}

class ItemDetailsInitial extends ItemDetailsState {}

class ItemdetailsFetchedSuccessfully extends ItemDetailsState {}

class ErrorFetchingItemdetails extends ItemDetailsState {
  String message;
  ErrorFetchingItemdetails({required this.message});
}

class FeatchingItemdetailsProgress extends ItemDetailsState {}
