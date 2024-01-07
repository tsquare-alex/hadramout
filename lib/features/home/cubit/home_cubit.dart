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

  ScrollController homePageScrollController = ScrollController();
  ScrollController sectionDetailsScrollController = ScrollController();

  late final List<SectionModel> _sections = [];
  List<SectionModel> get sections => _sections;

  late final List<SpeciesModel> _species = [];
  List<SpeciesModel> get species => _species;

  Future<void> getSections() async {
    final sections = await _homeRepository.getSections();
    _sections.addAll(sections);
  }

  Future<List<SpeciesModel>> getSpeciesBySection(String sectionName) async {
    return await _homeRepository.getSpeciesBySection(sectionName)
      ..sort((a, b) => a.title.compareTo(b.title));
  }

  Future<void> getSpecies() async {
    for (var section in sections) {
      _species.addAll(
        await _homeRepository.getSpeciesBySection(section.title),
      );
    }
  }

  Future<void> getHomeData() async {
    try {
      emit(HomeDataLoading());
      await getSections();
      await getSpecies();
      emit(HomeDataSuccess());
    } catch (error) {
      emit(HomeDataError(errorMessage: error.toString()));
    }
  }
}
