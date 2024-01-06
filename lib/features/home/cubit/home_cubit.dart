import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/features/home/data/repository/home_repository.dart';

import '../../../core/common/models/section.dart';
import '../../../src/app_export.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(
    this._homeRepository,
  ) : super(HomeInitial());

  static HomeBloc get(context) => BlocProvider.of<HomeBloc>(context);

  ScrollController pageScrollController = ScrollController();

  late final List<SectionModel> _sections = [];
  List<SectionModel> get sections => _sections;

  Future<void> getSections() async {
    final sections = await _homeRepository.getSections();
    _sections.addAll(sections);
  }

  Future<List<SpeciesModel>> getSpeciesBySection(String sectionName) async {
    return await _homeRepository.getSpeciesBySection(sectionName)
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

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
