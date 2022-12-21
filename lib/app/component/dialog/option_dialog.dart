import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtasnim_test/app/bloc/item_cubit.dart';
import 'package:qtasnim_test/app/component/dialog/item_option.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';
import 'package:qtasnim_test/router/router.gr.dart';

class OptionDialog extends StatelessWidget {
  final ItemUiModel data;

  const OptionDialog({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 20),
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(3)
                ),
                child: Text(data.type,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
            ItemOption(
                icon: const Icon(Icons.edit),
                title: 'Edit',
                onClick: () {
                  context.router.navigate(SetItemRoute(data: data));
                }
            ),
            ItemOption(
                icon: const Icon(Icons.highlight_remove_outlined),
                title: 'Hapus Item',
                onClick: () {
                  BlocProvider.of<ItemCubit>(context)
                      .deleteItem(data);
                  context.router.navigateBack();
                }
            )
          ],
        ),
      ),
    );
  }

}