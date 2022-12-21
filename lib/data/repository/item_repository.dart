import 'package:dartz/dartz.dart';
import 'package:qtasnim_test/data/local/database/item.dart';
import 'package:qtasnim_test/data/local/datasource/item_local_data_source.dart';
import 'package:qtasnim_test/data/mapper/item_mapper.dart';
import 'package:qtasnim_test/domain/repository/item_repository.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';
import 'package:qtasnim_test/utils/failure.dart';

class ItemRepositoryImpl extends ItemRepository {
  final ItemLocalDataSource _localDataSource;
  final ItemMapper _itemMapper;

  ItemRepositoryImpl(this._localDataSource, this._itemMapper);


  @override
  Future<Either<Failure, List<ItemUiModel>>> getListItem(String query) async {
    try {
      final data = await _localDataSource.getListItem(query);
      final dataMapper = data.map((item) => _itemMapper.map(item)).toList();

      return Right(dataMapper);
    } on Exception {
      return const Left(
          DatabaseFailure('Terjadi kesalahan dalam pengambilan data')
      );
    }
  }

  @override
  Future<Either<Failure, String>> addItem(Item item) async {
    try {
      await _localDataSource.addItem(item);

      return const Right('Berhasil menambahkan data');
    } on Exception {
      return const Left(
          DatabaseFailure('Terjadi kesalahan dalam menambahkan data')
      );
    }
  }

  @override
  Future<Either<Failure, List<ItemUiModel>>> getListItemByWord(String word) async {
    try {
      final data = await _localDataSource.getListItemByWord(word);
      final dataMapper = data.map((item) => _itemMapper.map(item)).toList();

      return Right(dataMapper);
    } on Exception {
      return const Left(
          DatabaseFailure('Terjadi kesalahan dalam pengambilan data')
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteItem(ItemUiModel item) async {
    try {
      await _localDataSource.deleteItem(_itemMapper.reverse(item));

      return const Right('Berhasil menambahkan data');
    } on Exception {
      return const Left(
          DatabaseFailure('Terjadi kesalahan dalam menambahkan data')
      );
    }
  }

}