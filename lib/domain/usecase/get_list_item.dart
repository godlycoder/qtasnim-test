import 'package:qtasnim_test/domain/repository/item_repository.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';
import 'package:dartz/dartz.dart';
import 'package:qtasnim_test/utils/failure.dart';

class GetListItem {
  final ItemRepository _repository;

  GetListItem(this._repository);

  Future<Either<Failure, List<ItemUiModel>>> execute(String query) {
    return _repository.getListItem(query);
  }

}