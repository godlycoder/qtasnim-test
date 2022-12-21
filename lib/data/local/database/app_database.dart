import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'item.dart';
import 'item_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [Item])
abstract class AppDatabase extends FloorDatabase {
  ItemDao get itemDao;
}