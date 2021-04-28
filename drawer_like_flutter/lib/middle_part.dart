import 'package:flutter/material.dart';

class MiddlePart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ListView(
        padding: EdgeInsets.only(top: 40),
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          ListViewItem(icon: Icons.person, title: 'Profile'),
          ListViewItem(icon: Icons.list_alt, title: 'Lists'),
          ListViewItem(icon: Icons.topic_outlined, title: 'Topics'),
          ListViewItem(icon: Icons.bookmark_border, title: 'Bookmarks'),
          ListViewItem(icon: Icons.star_border, title: 'Moments'),
        ],
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({this.icon, this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// TODO: 画面遷移
      },
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.grey,
                size: 30,
              ),
              SizedBox(width: 20),
              Text(
                '$title',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
