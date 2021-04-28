import 'package:flutter/material.dart';

class BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: false,
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconItem(iconData: Icons.lightbulb_outline),
              IconItem(iconData: Icons.qr_code),
            ],
          ),
        ),
      ],
    );
  }
}

class IconItem extends StatelessWidget {
  const IconItem({this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Icon(
        iconData,
        color: Colors.blue,
        size: 30,
      ),
    );
  }
}
