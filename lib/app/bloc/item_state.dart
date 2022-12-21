import 'package:qtasnim_test/domain/uimodel/item.dart';

abstract class ItemState {}

class InitialItemState extends ItemState {}

class LoadingItemState extends ItemState {}

class HasListItemState extends ItemState {
  final List<ItemUiModel> data;

  HasListItemState(this.data);
}

class EmptyListItemState extends ItemState {}

class ErrorItemState extends ItemState {
  final String message;

  ErrorItemState(this.message);
}

class SuccessAddItemState extends ItemState {
  final String message;

  SuccessAddItemState(this.message);
}

class SuccessDeleteItemState extends ItemState {}