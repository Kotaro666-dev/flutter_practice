import 'package:to_do_list_with_riverpod/model/to_do_item.dart';
import 'package:to_do_list_with_riverpod/view/home_page/home_page.dart';

class DeadlineList {
  DeadlineList({
    this.todayList,
    this.tomorrowList,
    this.next7DaysList,
    this.duringThisMonthList,
    this.undecided,
  });

  List<ToDoItem> todayList;
  List<ToDoItem> tomorrowList;
  List<ToDoItem> next7DaysList;
  List<ToDoItem> duringThisMonthList;
  List<ToDoItem> undecided;
}

List<ToDoItem> mockTodayList = [
  ToDoItem(
    id: 1,
    content: '洗濯物を洗う',
    deadline: Deadline.today,
    isSelected: false,
  ),
  ToDoItem(
    id: 2,
    content: '夕食の買い出し',
    deadline: Deadline.today,
    isSelected: false,
  ),
  ToDoItem(
    id: 3,
    content: '夕食の準備',
    deadline: Deadline.today,
    isSelected: false,
  ),
  ToDoItem(
    id: 4,
    content: 'Flutterの状態管理Riverpodの勉強',
    deadline: Deadline.today,
    isSelected: false,
  ),
  ToDoItem(
    id: 5,
    content: 'Flutterの勉強',
    deadline: Deadline.today,
    isSelected: false,
  ),
];

List<ToDoItem> mockTomorrowList = [
  ToDoItem(
    id: 1,
    content: '朝食の準備',
    deadline: Deadline.tomorrow,
    isSelected: false,
  ),
  ToDoItem(
    id: 2,
    content: '朝のストレッチ',
    deadline: Deadline.tomorrow,
    isSelected: false,
  ),
  ToDoItem(
    id: 3,
    content: '瞑想',
    deadline: Deadline.tomorrow,
    isSelected: false,
  ),
  ToDoItem(
    id: 4,
    content: '夕食の準備',
    deadline: Deadline.tomorrow,
    isSelected: false,
  ),
];

List<ToDoItem> mockThisWeekList = [
  ToDoItem(
    id: 1,
    content: 'GWの予定立て',
    deadline: Deadline.next7days,
    isSelected: false,
  ),
  ToDoItem(
    id: 2,
    content: '○○病院の付添',
    deadline: Deadline.next7days,
    isSelected: false,
  ),
  ToDoItem(
    id: 3,
    content: '出産祝いプレゼントの準備',
    deadline: Deadline.next7days,
    isSelected: false,
  ),
  ToDoItem(
    id: 4,
    content: 'プレゼントの発送',
    deadline: Deadline.next7days,
    isSelected: false,
  ),
];

List<ToDoItem> mockThisMonthList = [
  ToDoItem(
    id: 1,
    content: 'FT_Servicesに取り掛かる',
    deadline: Deadline.duringThisMonth,
    isSelected: false,
  ),
  ToDoItem(
    id: 2,
    content: 'Flutter の FirebaseAuth の学習をやる',
    deadline: Deadline.duringThisMonth,
    isSelected: false,
  ),
];
