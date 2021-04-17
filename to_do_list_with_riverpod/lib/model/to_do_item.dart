enum Deadline {
  today,
  tomorrow,
  thisWeek,
  thisMonth,
}

class ToDoItem {
  ToDoItem({this.id, this.content, this.deadline, this.isDone});

  int id;
  String content;
  Deadline deadline;
  bool isDone;

  ToDoItem copyWith({
    int id,
    String content,
    Deadline deadline,
    bool isDone,
  }) {
    return ToDoItem(
      id: id ?? this.id,
      content: content ?? this.content,
      deadline: deadline ?? this.deadline,
      isDone: isDone ?? this.isDone,
    );
  }
}

List<ToDoItem> toDoStaticLists = [
  ToDoItem(
    id: 1,
    content:
        'This is 1.This is 1.This is 1.This is 1.This is 1.This is 1.This is 1.This is 1.This is 1.This is 1.This is 1.',
    deadline: Deadline.today,
    isDone: false,
  ),
  ToDoItem(
    id: 2,
    content: 'This is 2',
    deadline: Deadline.tomorrow,
    isDone: false,
  ),
  ToDoItem(
    id: 3,
    content: 'This is 3',
    deadline: Deadline.thisWeek,
    isDone: false,
  ),
  ToDoItem(
    id: 4,
    content: 'This is 4',
    deadline: Deadline.thisMonth,
    isDone: false,
  ),
];
