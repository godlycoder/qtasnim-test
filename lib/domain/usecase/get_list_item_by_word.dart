import 'package:dartz/dartz.dart';
import 'package:qtasnim_test/domain/repository/item_repository.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';
import 'package:qtasnim_test/utils/failure.dart';

class GetListItemByWord {
  final ItemRepository _repository;

  GetListItemByWord(this._repository);

  Future<Either<Failure, List<ItemUiModel>>> execute(String word) {
    return _repository.getListItemByWord(word);
  }
}