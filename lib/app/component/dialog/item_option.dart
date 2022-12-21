import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemOption extends StatelessWidget {
  final Icon icon;
  final String title;
  final Function onClick;
  const ItemOption({super.key, required this.icon, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              children: [
                icon,
                Text(title)
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
      onTap: () {
        onClick();
      },
    );
  }

}