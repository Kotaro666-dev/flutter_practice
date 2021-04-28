import 'package:flutter/material.dart';

class UpperPart extends StatelessWidget {
  const UpperPart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.25,
      child: DrawerHeader(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.only(bottom: 0.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserAvatarSection(),
                  SizedBox(height: 10),
                  UserNameSection(),
                  UserIdSection(),
                  SizedBox(height: 10),
                  FollowingAndFollowersSection(),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: ThreeHorizontalDotIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

class ThreeHorizontalDotIcon extends StatelessWidget {
  const ThreeHorizontalDotIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// TODO: 画面下部からmodal sheetを出す
      },
      child: SizedBox(
        width: 30,
        height: 30,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.more_horiz,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class UserAvatarSection extends StatelessWidget {
  const UserAvatarSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      child: ClipOval(
        child: Image.asset('assets/images/profile_photo.jpeg'),
      ),
    );
  }
}

class UserNameSection extends StatelessWidget {
  const UserNameSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'kkamashi@42Tokyo',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class UserIdSection extends StatelessWidget {
  const UserIdSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '@Kotaro666_dev',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
    );
  }
}

class FollowingAndFollowersSection extends StatelessWidget {
  const FollowingAndFollowersSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Text(
              '416',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Following',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(width: 15),
        Row(
          children: [
            Text(
              '289',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Followers',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
