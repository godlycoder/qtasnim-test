import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qtasnim_test/app/component/button_group.dart';
import 'package:qtasnim_test/app/component/date_picker.dart';

class FilterDialog extends StatefulWidget {
  final Function(String) onApply;

  const FilterDialog({super.key, required this.onApply});

  @override
  State<StatefulWidget> createState() => _FilterDialogState();



}

class _FilterDialogState extends State<FilterDialog> {

  var _selectedSort = -1;
  int? _startDate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Filter',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Urutkan'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: UiKitButtonGroup(
                list: const ['Nama', 'Tanggal', 'Jenis Barang'],
                onChanged: (value ) {
                  setState(() {
                    _selectedSort = value;
                  });
                },
              ),
            ),
            Visibility(
              visible: _selectedSort == 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Penjualan :'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: UiKitButtonGroup(
                        initialIndex: 0,
                        list: const ['Tertinggi', 'Terendah'],
                        onChanged: (value) {

                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: UiKitDatePicker(
                                labelText: 'Dari',
                                onDateChanged: (value) {
                                  setState(() {
                                    _startDate = value;
                                  });
                                }
                            ),
                          ),
                        ),
                        Expanded(
                          child: UiKitDatePicker(
                            initialValue: _startDate,
                            labelText: 'Sampai',
                            onDateChanged: (value) {

                            }
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    _submitQuery();
                  },
                  child: const Text('Terapkan'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _submitQuery() {
    var query = '';

    if (_selectedSort == 0) {
      query = 'order-name';
    }

    if (_selectedSort == 1) {
      query = 'order-date';
    }

    if (_selectedSort == 2) {
      query = 'group-type';
    }

    widget.onApply(query);

  }

}