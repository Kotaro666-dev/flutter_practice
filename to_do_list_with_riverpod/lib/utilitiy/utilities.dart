import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/constants/constant.dart';

class StraightLineDivider extends StatelessWidget {
  const StraightLineDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 5,
      thickness: 1,
      indent: leftPadding,
      endIndent: 5,
    );
  }
}
