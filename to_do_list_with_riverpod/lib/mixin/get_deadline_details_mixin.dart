import 'package:flutter/material.dart';
import 'package:to_do_list_with_riverpod/constants/constant.dart';
import 'package:to_do_list_with_riverpod/model/to_do_item.dart';

mixin GetDeadlineDetailsMixin {
  String getDeadlineText(Deadline deadline) {
    if (deadline == Deadline.today) {
      return 'Today';
    } else if (deadline == Deadline.tomorrow) {
      return 'Tomorrow';
    } else if (deadline == Deadline.thisWeek) {
      return 'This Week';
    } else if (deadline == Deadline.thisMonth) {
      return 'This Month';
    } else if (deadline == Deadline.unselected) {
      return 'Unknown';
    } else {
      return '';
    }
  }

  Color getDeadlineColor(Deadline deadline) {
    if (deadline == Deadline.today) {
      return kTodayColor;
    } else if (deadline == Deadline.tomorrow) {
      return kTomorrowColor;
    } else if (deadline == Deadline.thisWeek) {
      return kThisWeekColor;
    } else if (deadline == Deadline.thisMonth) {
      return kThisMonthColor;
    } else if (deadline == Deadline.unselected) {
      return Colors.grey.shade800;
    } else {
      return Colors.white;
    }
  }
}
