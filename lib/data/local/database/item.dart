
import 'package:floor/floor.dart';

@entity
class Item {

  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final int stock;
  final int sold;
  final int transactionDate;
  final String type;

  Item(this.id, this.name, this.stock, this.sold, this.transactionDate, this.type);

}