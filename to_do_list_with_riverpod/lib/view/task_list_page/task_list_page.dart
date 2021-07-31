import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/constants/constant.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/riverpod/deadline_list_notifier.dart';
import 'package:to_do_list_with_riverpod/riverpod/providers.dart';
import 'package:to_do_list_with_riverpod/utilitiy/utilities.dart';
import 'package:to_do_list_with_riverpod/view/task_list_page/task_list_page_model.dart';

import '../../riverpod/providers.dart';

class TaskListPageArgument {
  TaskListPageArgument({this.deadlineType});
  final Deadline deadlineType;
}

class TaskListPage extends ConsumerWidget {
  const TaskListPage({this.deadlineType});
  final Deadline deadlineType;

  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final model = watch(taskListPageModelProvider(deadlineType));
    final listNotifier = watch(deadlineListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('${model.getDeadlineAppBarTitle(deadlineType)}'),
      ),
      body: SafeArea(
        child: listNotifier.getToDoList(deadlineType).isEmpty
            ? const ShowToDoListEmpty()
            : AnimatedList(
                key: listNotifier.listKey,
                initialItemCount: listNotifier.getToDoList(deadlineType).length,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return _buildAnimatedListView(
                      animation, model, listNotifier, index);
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
          await _buildOnTapAddNewToDoButton(
            context,
            model.resetModalBottomSheet,
          );
        },
      ),
    );
  }

  SizeTransition _buildAnimatedListView(
    Animation<double> animation,
    TaskListPageModel model,
    DeadlineListNotifier listNotifier,
    int index,
  ) {
    final item = listNotifier.getToDoList(deadlineType)[index];
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
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
                        behavior: HitTestBehavior.opaque,
                        onTap: () async {
                          HapticFeedback.lightImpact();
                          _startRemoveAnimation(
                              listNotifier, item, index, model);
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: listNotifier
                                    .getToDoList(deadlineType)[index]
                                    .isSelected
                                ? Colors.white
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                          ),
                          child: listNotifier
                                  .getToDoList(deadlineType)[index]
                                  .isSelected
                              ? FittedBox(
                                  fit: BoxFit.fill,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.grey[800],
                                  ),
                                )
                              : Container(),
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
              SizedBox(height: item.deadline != Deadline.undecided ? 10 : 0),
              if (item.deadline != Deadline.undecided)
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 15,
                        color: model.getDeadlineColor(item.deadline),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        model.getDeadlineText(item.deadline),
                        style: TextStyle(
                          color: model.getDeadlineColor(item.deadline),
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
      ),
    );
  }

  void _startRemoveAnimation(DeadlineListNotifier listNotifier, ToDoItem item,
      int index, TaskListPageModel model) {
    listNotifier.setItemIsSelectedTrue(
      id: item.id,
      deadlineType: deadlineType,
    );
    final nextIndex = index == listNotifier.getToDoList(deadlineType).length - 1
        ? index - 1
        : index;
    const duration = 400;
    Future<void>.delayed(const Duration(milliseconds: duration)).then((_) => {
          listNotifier.listKey.currentState.removeItem(
            index,
            (BuildContext context, Animation<double> animation) {
              /// Animation Reference: https://medium.com/flutter-community/the-magic-of-animatedlist-18afb2ba564c
              return removeToDoItemAnimation(
                  animation, model, listNotifier, nextIndex);
            },
            duration: const Duration(milliseconds: duration),
          )
        });
    Future<void>.delayed(const Duration(milliseconds: duration)).then((_) => {
          listNotifier.removeNewToDoItem(
            id: item.id,
            deadlineType: deadlineType,
          )
        });
  }

  FadeTransition removeToDoItemAnimation(
      Animation<double> animation,
      TaskListPageModel model,
      DeadlineListNotifier listNotifier,
      int nextIndex) {
    return FadeTransition(
      opacity:
          CurvedAnimation(parent: animation, curve: const Interval(0.5, 1)),
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animation, curve: const Interval(0, 1)),
        axisAlignment: 0,
        child:
            _buildAnimatedListView(animation, model, listNotifier, nextIndex),
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
            final model = watch(taskListPageModelProvider(deadlineType));
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
                          children: [
                            const SizedBox(width: 10),
                            DeadlineCard(
                                deadlineType: Deadline.today, model: model),
                            const SizedBox(width: 10),
                            DeadlineCard(
                                deadlineType: Deadline.tomorrow, model: model),
                            const SizedBox(width: 10),
                            DeadlineCard(
                                deadlineType: Deadline.next7days, model: model),
                            const SizedBox(width: 10),
                            DeadlineCard(
                                deadlineType: Deadline.duringThisMonth,
                                model: model),
                            const SizedBox(width: 10),
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
                                    final isSafeAnimateList = listNotifier
                                            .getToDoList(deadlineType)
                                            .isNotEmpty &&
                                        deadlineType ==
                                            model.selectedDeadlineType;
                                    if (isSafeAnimateList) {
                                      listNotifier.listKey.currentState
                                          .insertItem(
                                        listNotifier
                                            .getToDoList(deadlineType)
                                            .length,
                                        duration:
                                            const Duration(milliseconds: 200),
                                      );
                                    }
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

class ShowToDoListEmpty extends StatelessWidget {
  const ShowToDoListEmpty({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Your ToDo list is empty',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class DeadlineCard extends ConsumerWidget {
  const DeadlineCard({
    this.deadlineType,
    this.model,
    Key key,
  }) : super(key: key);

  final Deadline deadlineType;
  final TaskListPageModel model;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final color = model.getDeadlineColor(deadlineType);
    return GestureDetector(
      onTap: () => model.onTapSelectDeadlineCard(deadlineType),
      child: SizedBox(
        height: 40,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              // color: Colors.grey.shade800,
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
