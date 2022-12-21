
import 'package:floor/floor.dart';
import 'package:qtasnim_test/data/local/database/item.dart';

@dao
abstract class ItemDao {

  @Query('SELECT * FROM Item')
  Future<List<Item>> findAllItem();

  @Query('SELECT * FROM Item ORDER BY name ASC')
  Future<List<Item>> findAllItemOrderByName();

  @Query('SELECT * FROM Item ORDER BY transactionDate ASC')
  Future<List<Item>> findAllItemOrderByTransactionDate();

  @Query('SELECT * FROM Item GROUP BY type')
  Future<List<Item>> findAllItemGroupByType();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertItem(Item item);

  @Query('SELECT * FROM Item WHERE name LIKE :word')
  Future<List<Item>> findAllItemByWord(String word);

  @delete
  Future<void> deleteItem(Item item);
}