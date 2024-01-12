import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/features/home/data/repository/home_repository.dart';
import 'package:url_launcher/url_launcher.dart';

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

  late final Set<SpeciesModel> _homeSpecies = {};
  List<SpeciesModel> get homeSpecies => _homeSpecies.toList();

  late final Set<SpeciesModel> _species = {};
  List<SpeciesModel> get species => _species.toList();

  Future<void> getSections() async {
    final sections = await _homeRepository.getSections()
      ..sort((a, b) => a.index.compareTo(b.index));
    _sections.addAll(sections);
  }

  Future<List<SpeciesModel>> getSpeciesBySection(String sectionName) async {
    return await _homeRepository.getSpeciesBySectionLimited(sectionName)
      ..sort((a, b) => a.title.compareTo(b.title));
  }

  Future<void> getHomeSpecies() async {
    for (var section in sections) {
      _homeSpecies.addAll(
        await _homeRepository.getSpeciesBySectionLimited(section.title),
      );
    }
  }

  Future<void> getAllSpecies(SectionModel section) async {
    emit(SectionDetailsLoading());
    _species.clear();
    try {
      _species
          .addAll(await _homeRepository.getAllSpeciesBySection(section.title));
      emit(SectionDetailsSuccess());
    } catch (error) {
      emit(SectionDetailsError(errorMessage: error.toString()));
    }
  }

  Future<void> getHomeData() async {
    try {
      emit(HomeDataLoading());
      await getSections();
      await getHomeSpecies();
      emit(HomeDataSuccess());
    } catch (error) {
      emit(HomeDataError(errorMessage: error.toString()));
    }
  }

  final url =
      "https://www.facebook.com/profile.php?id=61555330461128&mibextid=ZbWKwL";
  void openUrl() async {
    // emit(HomeDataLoading());
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  final whatsappUrl = 'http://wa.me/+201027475557';
  void openWhatsapp() async {
    var uri = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  final landlineUrl = 'tel:0224470999';
  void callLandline() async {
    var uri = Uri.parse(landlineUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  final mobileUrl = 'tel:01555400990';
  void callMobile() async {
    var uri = Uri.parse(mobileUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
