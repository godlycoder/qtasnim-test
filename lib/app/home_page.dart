import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtasnim_test/app/bloc/item_cubit.dart';
import 'package:qtasnim_test/app/bloc/item_state.dart';
import 'package:qtasnim_test/app/component/app_bar.dart';
import 'package:qtasnim_test/app/component/dialog/filter_dialog.dart';
import 'package:qtasnim_test/router/router.gr.dart';

import 'component/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    BlocProvider.of<ItemCubit>(context)
        .getListItem();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: UiKitAppBar(
        onChanged: (text) {
          BlocProvider.of<ItemCubit>(context)
              .getListItemByWord(text);
        },
        onFilterClicked: () {
          showModalBottomSheet(
              context: context,
              builder: (_) => FilterDialog(
                onApply: (query) {
                  BlocProvider.of<ItemCubit>(context)
                      .getListItem(query: query);

                  context.router.navigateBack();
                }
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.router.navigate(SetItemRoute());
        },
        label: const Text('Tambah'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocListener<ItemCubit, ItemState>(
              listener: (_, state) {

              },
              child: BlocBuilder<ItemCubit, ItemState>(
                buildWhen: (_, state) {
                  return state is! SuccessAddItemState;
                },
                builder: (_, state) {
                  if (state is HasListItemState) {
                    final list = state.data;

                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        return UiKitItem(data: list[index]);
                      },
                    );
                  }

                  if (state is EmptyListItemState) {
                    return const Center(
                      child: Text('Data kosong'),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                },
              ),
            ),
          )
        ],
      ),
    );
  }
}