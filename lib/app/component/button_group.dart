import 'package:flutter/material.dart';

class UiKitButtonGroup extends StatefulWidget {
  final List<String> list;
  final Function(int) onChanged;
  final int? initialIndex;

  const UiKitButtonGroup({super.key, required this.list, required this.onChanged, this.initialIndex});

  @override
  State<StatefulWidget> createState() => _UiKitButtonGroupState();

}

class _UiKitButtonGroupState extends State<UiKitButtonGroup> {

  var _selectedIndex = -1;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex ?? -1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.list.length,
          itemBuilder: (_, index) {
            onSelected() {
              setState(() {
                _selectedIndex = index;
                widget.onChanged(index);
              });
            }

            if (_selectedIndex == index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                    onPressed: () {
                      onSelected();
                    },
                    child: Text(widget.list[index])
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: OutlinedButton(
                  onPressed: () {
                    onSelected();
                  },
                  child: Text(widget.list[index])
              ),
            );
          }
      ),
    );
  }
}