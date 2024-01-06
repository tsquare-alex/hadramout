import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadrmouthamza/features/home/data/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(super.initialState);

  List<String> sectionsNames = [
    "قسم الدجاج",
    "قسم اللحوم",
    "قسم الطواجن",
    "قسم اللحوم",
    "قسم المشروبات",
    "قسم السلطات",
    "قسم المشويات",
  ];
}
