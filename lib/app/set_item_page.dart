import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtasnim_test/app/bloc/item_cubit.dart';
import 'package:qtasnim_test/app/component/date_picker.dart';
import 'package:qtasnim_test/app/component/text_field.dart';
import 'package:qtasnim_test/data/local/database/item.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';

class SetItemPage extends StatefulWidget {
  final ItemUiModel? data;

  const SetItemPage({super.key, this.data});

  @override
  State<StatefulWidget> createState() => _SetItemPageState();

}

class _SetItemPageState extends State<SetItemPage> {

  final _nameController = TextEditingController();
  final _stockController = TextEditingController();
  final _soldController = TextEditingController();
  final _typeController = TextEditingController();
  int? _transDateMillis;

  var isReady = false;

  @override
  void initState() {
    final data = widget.data;
    if (data != null) {
      _nameController.text = data.name;
      _stockController.text = data.stock.toString();
      _soldController.text = data.sold.toString();
      _typeController.text = data.type;
      _transDateMillis = data.transactionDate;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _validatedForm();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data != null ? 'Edit item' : 'Tambah item'
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (isReady) {
                _addItem();
              }
            },
            child: Text(
              'Simpan',
              style: TextStyle(
                  color: isReady? Colors.white : Colors.grey
              ),
            )
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: UiKitTextField(
              hintText: 'Nama item',
              controller: _nameController,
              onTextChanged: (text) {
                _validatedForm();
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 10, bottom: 10),
                  child: UiKitTextField(
                    hintText: 'Stok',
                    controller: _stockController,
                    type: TextInputType.number,
                    onTextChanged: (text) {
                      _validatedForm();
                    }
                  ),
                )
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10, right: 20, bottom: 10),
                    child: UiKitTextField(
                      hintText: 'Terjual',
                      controller: _soldController,
                      type: TextInputType.number,
                      onTextChanged: (text) {
                        _validatedForm();
                      }
                    ),
                  )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: UiKitTextField(
              hintText: 'Jenis item',
              controller: _typeController,
              onTextChanged: (text) {
                _validatedForm();
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: UiKitDatePicker(
              labelText: 'Tanggal transaksi',
              onDateChanged: (value) {
                setState(() {
                  _transDateMillis = value;
                });
                _validatedForm();
              },
            ),
          ),
        ],
      ),
    );
  }

  _validatedForm() {
    final name = _nameController.text;
    final stock = _stockController.text;
    final sold = _soldController.text;
    final type = _typeController.text;

    setState(() {
      isReady = name.isNotEmpty &&
          stock.isNotEmpty &&
          sold.isNotEmpty &&
          type.isNotEmpty &&
          _transDateMillis != null;
    });
  }

  void _addItem() {
    final cubit = BlocProvider.of<ItemCubit>(context);

    final name = _nameController.text;
    final stock = _stockController.text;
    final sold = _soldController.text;
    final type = _typeController.text;
    final trans = _transDateMillis!;

    final item = Item(
      widget.data?.id, name, int.parse(stock), int.parse(sold), trans, type
    );
    cubit.addItem(item);
    context.router.navigateBack();
  }
}