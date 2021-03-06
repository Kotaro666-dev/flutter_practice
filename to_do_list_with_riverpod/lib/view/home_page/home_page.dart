import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/utilitiy/utilities.dart';

import '../../riverpod/providers.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final notifier = watch(deadlineListProvider);
    final model = watch(homePageModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
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
              title: 'Next 7 Days',
              count: notifier.deadlineList.next7DaysList.length,
              type: Deadline.next7days,
            ),
            const StraightLineDivider(),
            DeadlineListItem(
              title: 'During This Month',
              count: notifier.deadlineList.duringThisMonthList.length,
              type: Deadline.duringThisMonth,
            ),
            const StraightLineDivider(),
            DeadlineListItem(
              title: 'Undecided',
              count: notifier.deadlineList.undecided.length,
              type: Deadline.undecided,
            ),
            const StraightLineDivider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          await _buildOnTapAddNewToDoButton(
            context,
            model.resetModalBottomSheet,
          );
        },
      ),
    );
  }

  Future<void> _buildOnTapAddNewToDoButton(
    BuildContext context,
    VoidCallback resetModalBottomSheet,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Consumer(
          builder: (BuildContext context, watch, child) {
            final model = watch(homePageModelProvider);
            final listNotifier = watch(deadlineListProvider);
            return GestureDetector(
              onTap: () => model.resetSelectedDeadlineCard,
              child: SizedBox(
                height: 150,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: model.textEditingController,
                          onChanged: model.onChanged,
                          autofocus: true,
                          cursorColor: Colors.red,
                          cursorHeight: 20,
                          decoration: const InputDecoration(
                            hintText: 'Add a task',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: const [
                            SizedBox(width: 10),
                            DeadlineCard(deadlineType: Deadline.today),
                            SizedBox(width: 10),
                            DeadlineCard(deadlineType: Deadline.tomorrow),
                            SizedBox(width: 10),
                            DeadlineCard(deadlineType: Deadline.next7days),
                            SizedBox(width: 10),
                            DeadlineCard(
                                deadlineType: Deadline.duringThisMonth),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  model.isActive ? Colors.red : Colors.grey,
                              radius: 15,
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                splashColor: Colors.transparent,
                                color: Colors.white,
                                icon: const Icon(Icons.arrow_upward_sharp),
                                onPressed: () {
                                  if (model.isActive) {
                                    listNotifier.addNewToDoItem(
                                        content: model.content,
                                        selectedDeadlineType:
                                            model.selectedDeadlineType);
                                    model.onTapSubmitButton(context);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      resetModalBottomSheet();
    });
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
    final model = watch(homePageModelProvider);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
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

class DeadlineCard extends ConsumerWidget {
  const DeadlineCard({
    this.deadlineType,
    Key key,
  }) : super(key: key);

  final Deadline deadlineType;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final model = watch(homePageModelProvider);
    final color = model.getDeadlineColor(deadlineType);
    return GestureDetector(
      onTap: () => model.onTapSelectDeadlineCard(deadlineType),
      child: SizedBox(
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: deadlineType == model.selectedDeadlineType
                  ? color
                  : Colors.grey.shade800,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${model.getDeadlineText(deadlineType)}',
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
