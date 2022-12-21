import 'package:dartz/dartz.dart';
import 'package:qtasnim_test/data/local/database/item.dart';
import 'package:qtasnim_test/domain/repository/item_repository.dart';
import 'package:qtasnim_test/utils/failure.dart';

import '../uimodel/item.dart';

class DeleteItem {
  final ItemRepository _repository;

  DeleteItem(this._repository);

  Future<Either<Failure, void>> execute(ItemUiModel item) {
    return _repository.deleteItem(item);
  }
}