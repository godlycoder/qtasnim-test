import 'package:qtasnim_test/data/local/database/item.dart';
import 'package:qtasnim_test/data/local/database/item_dao.dart';

abstract class ItemLocalDataSource {
  Future<List<Item>> getListItem(String query);

  Future<void> addItem(Item item);

  Future<List<Item>> getListItemByWord(String word);

  Future<void> deleteItem(Item item);

}

class ItemLocalDataSourceImpl extends ItemLocalDataSource {

  final ItemDao _itemDao;

  ItemLocalDataSourceImpl(this._itemDao);

  @override
  Future<List<Item>> getListItem(String query) async {

    final splitQuery = query.split('-');

    if (splitQuery[0] == 'order') {
      if (splitQuery[1] == 'name') return _itemDao.findAllItemOrderByName();
      return _itemDao.findAllItemOrderByTransactionDate();
    } if (splitQuery[0] == 'group') {
      return _itemDao.findAllItemGroupByType();
    }

    return _itemDao.findAllItem();
  }

  @override
  Future<void> addItem(Item item) {
    return _itemDao.insertItem(item);
  }

  @override
  Future<List<Item>> getListItemByWord(String word) {
    return _itemDao.findAllItemByWord('%$word%');
  }

  @override
  Future<void> deleteItem(Item item) {
    return _itemDao.deleteItem(item);
  }

}