
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UiKitDatePicker extends StatefulWidget {
  final int? initialValue;
  final String labelText;
  final Function(int) onDateChanged;

  const UiKitDatePicker({super.key, this.initialValue, required this.labelText, required this.onDateChanged});

  @override
  State<StatefulWidget> createState() => _UiKitDatePickerState();

}

class _UiKitDatePickerState extends State<UiKitDatePicker> {
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  var _dateLabel = '';

  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    _dateTime = DateTime.fromMillisecondsSinceEpoch(widget.initialValue ?? DateTime.now().millisecondsSinceEpoch);
    _dateLabel = _dateFormat.format(_dateTime);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(widget.labelText,
            style: const TextStyle(
                fontSize: 12
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)
            ),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      _dateLabel,
                    )
                ),
                const Icon(Icons.calendar_month)
              ],
            ),
          ),
          onTap: () async {
            final currYear = DateTime.now().year;
           DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: _dateTime,
                firstDate: DateTime(currYear - 5),
                lastDate: DateTime.now()
            );

           if (dateTime != null) {
             setState(() {
               _dateLabel = _dateFormat.format(dateTime);
               widget.onDateChanged(dateTime.millisecondsSinceEpoch);
             });
           }
          },
        )
      ],
    );
  }
}