import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../data_source/home_data_source.dart';

class HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  Future<List<SectionModel>> getSections() async {
    try {
      final data = await _homeDataSource.getSections();
      return data.docs.map((doc) => SectionModel.fromJson(doc.data())).toList();
    } on FirebaseException catch (_) {
      return List.empty();
    }
  }

  Future<List<SpeciesModel>> getSpeciesBySectionLimited(
      String sectionName) async {
    try {
      final data =
          await _homeDataSource.getSpeciesBySectionLimited(sectionName);
      return data.docs.map((doc) => SpeciesModel.fromJson(doc.data())).toList();
    } on FirebaseException catch (_) {
      return List.empty();
    }
  }

  Future<List<SpeciesModel>> getAllSpeciesBySection(String sectionName) async {
    try {
      final data =
          await _homeDataSource.getAllSpeciesBySection(sectionName);
      return data.docs.map((doc) => SpeciesModel.fromJson(doc.data())).toList();
    } on FirebaseException catch (_) {
      return List.empty();
    }
  }
}
