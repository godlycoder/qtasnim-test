import 'package:dartz/dartz.dart';
import 'package:qtasnim_test/data/local/database/item.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';
import 'package:qtasnim_test/utils/failure.dart';

abstract class ItemRepository {
  Future<Either<Failure, List<ItemUiModel>>> getListItem(String query);

  Future<Either<Failure, String>> addItem(Item item);

  Future<Either<Failure, List<ItemUiModel>>> getListItemByWord(String word);

  Future<Either<Failure, void>> deleteItem(ItemUiModel item);

}