import 'package:dartz/dartz.dart';
import 'package:qtasnim_test/data/local/database/item.dart';
import 'package:qtasnim_test/domain/repository/item_repository.dart';
import 'package:qtasnim_test/utils/failure.dart';

class AddItem {
  final ItemRepository _repository;

  AddItem(this._repository);

  Future<Either<Failure, String>> execute(Item item) {
    return _repository.addItem(item);
  }
}