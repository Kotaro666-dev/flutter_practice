import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/constants/constant.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/riverpod/providers.dart';

import '../riverpod/providers.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final notifier = watch(homePageProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: notifier.toDoList.isEmpty
          ? const Center(
              child: Text(
                'ToDoList is Empty',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : SafeArea(
              child: ListView.builder(
                itemCount: notifier.toDoList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = notifier.toDoList[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: leftPadding),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      notifier.onTapToDoDone(item.id);
                                    },
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${item.content}',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: item.deadline != Deadline.unselected
                                  ? 10
                                  : 0),
                          if (item.deadline != Deadline.unselected)
                            Padding(
                              padding: const EdgeInsets.only(left: 45),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 15,
                                    color: notifier
                                        .getDeadlineColor(item.deadline),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    notifier.getDeadlineText(item.deadline),
                                    style: TextStyle(
                                      color: notifier
                                          .getDeadlineColor(item.deadline),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(height: 10),
                          const StraightLineDivider(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          await _buildOnTapAddToDoButton(context);
        },
      ),
    );
  }

  Future<void> _buildOnTapAddToDoButton(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 180,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black26,
            ),
            child: Consumer(builder: (BuildContext context, watch, child) {
              final notifier = watch(homePageProvider);
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: notifier.textEditingController,
                          onChanged: notifier.onChanged,
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          DeadlineCard(type: Deadline.today),
                          DeadlineCard(type: Deadline.tomorrow),
                          DeadlineCard(type: Deadline.thisWeek),
                          DeadlineCard(type: Deadline.thisMonth),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: CircleAvatar(
                      backgroundColor:
                          notifier.isActive ? Colors.red : Colors.grey,
                      radius: 15,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        splashColor: Colors.transparent,
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_upward_sharp),
                        onPressed: () {
                          if (notifier.isActive) {
                            notifier.onTapSubmitButton(context);
                          }
                        },
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        );
      },
    );
  }
}

class DeadlineCard extends ConsumerWidget {
  const DeadlineCard({
    this.type,
    Key key,
  }) : super(key: key);

  final Deadline type;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final notifier = watch(homePageProvider);
    final color = notifier.getDeadlineColor(type);
    return GestureDetector(
      onTap: () => notifier.onTapDeadlineCard(type),
      child: SizedBox(
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              // color: Colors.grey.shade800,
              color: type == notifier.selectedDeadlineType
                  ? color
                  : Colors.grey.shade800,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${notifier.getDeadlineText(type)}',
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
