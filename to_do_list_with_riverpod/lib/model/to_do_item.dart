enum Deadline {
  undecided,
  today,
  tomorrow,
  next7days,
  duringThisMonth,
}

class ToDoItem {
  ToDoItem({this.id, this.content, this.deadline, this.isSelected});

  int id;
  String content;
  Deadline deadline;
  bool isSelected;

  ToDoItem copyWith({
    int id,
    String content,
    Deadline deadline,
    bool isSelected,
  }) {
    return ToDoItem(
      id: id ?? this.id,
      content: content ?? this.content,
      deadline: deadline ?? this.deadline,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
