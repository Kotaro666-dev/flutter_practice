import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/utilitiy/utilities.dart';

import '../../riverpod/providers.dart';

class CategoryPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final notifier = watch(deadlineListProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            DeadlineListItem(
              title: 'Today',
              count: notifier.deadlineList.todayList.length,
              type: Deadline.today,
            ),
            const StraightLineDivider(),
            DeadlineListItem(
              title: 'Tomorrow',
              count: notifier.deadlineList.tomorrowList.length,
              type: Deadline.tomorrow,
            ),
            const StraightLineDivider(),
            DeadlineListItem(
              title: 'This Week',
              count: notifier.deadlineList.thisWeekList.length,
              type: Deadline.thisWeek,
            ),
            const StraightLineDivider(),
            DeadlineListItem(
              title: 'This Month',
              count: notifier.deadlineList.thisMonthList.length,
              type: Deadline.thisMonth,
            ),
          ],
        ),
      ),
    );
  }
}

class DeadlineListItem extends ConsumerWidget {
  const DeadlineListItem({
    Key key,
    @required this.title,
    @required this.count,
    @required this.type,
  }) : super(key: key);

  final String title;
  final int count;
  final Deadline type;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final model = watch(categoryPageProvider);
    final deadlineTypeNotifier = watch(deadlineTypeProvider);
    return GestureDetector(
      onTap: () {
        deadlineTypeNotifier.deadlineType = type;
        model.onTapDeadlineListItem(context, type);
      },
      child: SizedBox(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                '$count',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
