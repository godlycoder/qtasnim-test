import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UiKitAppBar extends StatelessWidget implements PreferredSize {
  final Function(String) onChanged;
  final Function onFilterClicked;

  const UiKitAppBar({super.key, required this.onChanged, required this.onFilterClicked});

  @override
  Size get preferredSize => const Size.fromHeight(115);

  @override
  // TODO: implement child
  Widget get child => Container(
    height: preferredSize.height,
    color: Colors.blue,
    padding: const EdgeInsets.only(top: 20, left: 20),
    child: Row(
      children: [
        Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Cari berdasarkan nama item',
                  fillColor: Colors.white70
              ),
              onChanged: (text) {
                onChanged(text);
              },
            )
        ),
        IconButton(
            onPressed: () {
              onFilterClicked();
            },
            icon: const Icon(Icons.filter_list)
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return child;
  }

}