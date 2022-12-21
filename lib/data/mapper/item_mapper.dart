import 'package:qtasnim_test/data/local/database/item.dart';
import 'package:qtasnim_test/data/mapper/mapper.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';

class ItemMapper extends Mapper<Item, ItemUiModel> {

  @override
  ItemUiModel map(Item item) {
    return ItemUiModel(item.id, item.name, item.sold, item.stock, item.transactionDate, item.type);
  }

  @override
  Item reverse(ItemUiModel item) {
    return Item(item.id, item.name, item.sold, item.stock, item.transactionDate, item.type);
  }

}