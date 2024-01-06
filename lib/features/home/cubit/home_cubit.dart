import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadrmouthamza/features/home/data/repository/home_repository.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(
    this._homeRepository,
  ) : super(HomeInitial());

  static HomeBloc get(context) => BlocProvider.of<HomeBloc>(context);

  ScrollController pageScrollController = ScrollController();

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
