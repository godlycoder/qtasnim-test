import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtasnim_test/app/bloc/item_state.dart';
import 'package:qtasnim_test/data/local/database/item.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';
import 'package:qtasnim_test/domain/usecase/add_item.dart';
import 'package:qtasnim_test/domain/usecase/delete_item.dart';
import 'package:qtasnim_test/domain/usecase/get_list_item.dart';
import 'package:qtasnim_test/domain/usecase/get_list_item_by_word.dart';

class ItemCubit extends Cubit<ItemState> {

  final GetListItem _getListItem;
  final AddItem _addItem;
  final GetListItemByWord _getListItemByWord;
  final DeleteItem _deleteItem;

  ItemCubit(this._getListItem, this._addItem, this._getListItemByWord, this._deleteItem): super(InitialItemState());

  void getListItem({String query = ''}) async {
    emit(LoadingItemState());

    final result = await _getListItem.execute(query);
    result.fold(
        (error) => emit(ErrorItemState(error.message)),
        (data) => {
          if (data.isEmpty) emit(EmptyListItemState())
          else emit(HasListItemState(data))
        }
    );
  }

  void addItem(Item item) async {
    final result = await _addItem.execute(item);
    result.fold(
      (error) => emit(ErrorItemState(error.message)),
      (data) => getListItem()
    );
  }

  void getListItemByWord(String word) async {
    final result = await _getListItemByWord.execute(word);
    result.fold(
        (error) => emit(ErrorItemState(error.message)),
        (data) => {
          if (data.isEmpty) emit(EmptyListItemState())
          else emit(HasListItemState(data))
        }
    );
  }

  void deleteItem(ItemUiModel item) async {
    final result = await _deleteItem.execute(item);
    result.fold(
            (error) => emit(ErrorItemState(error.message)),
            (data) => {
              getListItem()
            }
    );
  }
}