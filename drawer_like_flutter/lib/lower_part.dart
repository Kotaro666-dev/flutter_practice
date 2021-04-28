import 'package:flutter/material.dart';

class LowerPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: ListView(
            padding: EdgeInsets.only(top: 40),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              ListViewItem(title: 'Settings and privacy'),
              SizedBox(height: 40),
              ListViewItem(title: 'Help Center'),
            ],
          ),
        ),
      ],
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        '$title',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
