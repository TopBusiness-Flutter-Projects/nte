import 'package:flutter_bloc/flutter_bloc.dart';

part 'tab_control_state.dart';

class TabControlCubit extends Cubit<TabControlState> {
  TabControlCubit() : super(TabControlInitial());
  int currentIndex = 0;

  selectTap(int index) {
    currentIndex = index;

    emit(ChangeCurrentIndexTap());
  }
}
