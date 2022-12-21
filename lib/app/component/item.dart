import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qtasnim_test/app/component/dialog/option_dialog.dart';
import 'package:qtasnim_test/domain/uimodel/item.dart';

class UiKitItem extends StatelessWidget {

  final ItemUiModel data;

  const UiKitItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');

    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                      Text(dateFormat.format(DateTime.fromMillisecondsSinceEpoch(data.transactionDate))),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
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
                      )
                    ],
                  )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Sisa ${data.stock} item',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text('Terjual ${data.sold}',
                    style: const TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _showDialog(context);
      },
    );
  }

  _showDialog(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20)
            )
        ),
        context: context,
        builder: (_) {
          return OptionDialog(data: data);
        }
    );
  }

}