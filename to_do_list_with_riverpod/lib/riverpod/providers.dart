import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_list_with_riverpod/view/home_page_notifier.dart';

final homePageNotifier = ChangeNotifierProvider((ref) => HomePageNotifier());
