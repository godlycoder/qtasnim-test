import 'package:get_it/get_it.dart';
import 'package:qtasnim_test/app/bloc/item_cubit.dart';
import 'package:qtasnim_test/data/local/database/app_database.dart';
import 'package:qtasnim_test/data/local/datasource/item_local_data_source.dart';
import 'package:qtasnim_test/data/mapper/item_mapper.dart';
import 'package:qtasnim_test/data/repository/item_repository.dart';
import 'package:qtasnim_test/domain/repository/item_repository.dart';
import 'package:qtasnim_test/domain/usecase/add_item.dart';
import 'package:qtasnim_test/domain/usecase/delete_item.dart';
import 'package:qtasnim_test/domain/usecase/get_list_item.dart';
import 'package:qtasnim_test/domain/usecase/get_list_item_by_word.dart';

import 'data/local/database/item_dao.dart';

final locator = GetIt.instance;

Future<void> init() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  final itemDao = database.itemDao;

  //region Common

  locator.registerLazySingleton<ItemDao>(() => itemDao);

  //endregion

  //region Cubit

  locator.registerFactory<ItemCubit>(() => ItemCubit(
    locator(),
    locator(),
    locator(),
    locator()
  ));

  //endregion

  //region Use Case

  locator.registerFactory<GetListItem>(() => GetListItem(locator()));
  locator.registerFactory<AddItem>(() => AddItem(locator()));
  locator.registerFactory<GetListItemByWord>(() => GetListItemByWord(locator()));
  locator.registerFactory<DeleteItem>(() => DeleteItem(locator()));

  //endregion

  //region Repository

  locator.registerFactory<ItemRepository>(() => ItemRepositoryImpl(locator(), locator()));

  //endregion

  //region Local Data Source

  locator.registerFactory<ItemLocalDataSource>(() => ItemLocalDataSourceImpl(locator()));

  //endregion

  //region Mapper

  locator.registerFactory<ItemMapper>(() => ItemMapper());

  //endregion

}