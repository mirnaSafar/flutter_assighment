part of 'items_cubit.dart';

@immutable
class ItemsState {}

class ItemsInitial extends ItemsState {}

class ItemsFetchedSuccessfully extends ItemsState {}

class ErrorFetchingItems extends ItemsState {
  String message;
  ErrorFetchingItems({required this.message});
}

class NoItemsYet extends ItemsState {}

class FeatchingItemsProgress extends ItemsState {}
