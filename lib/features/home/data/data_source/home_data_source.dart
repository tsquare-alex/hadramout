import 'package:hadrmouthamza/src/app_export.dart';

class HomeDataSource {
  final _firebaseDatabase = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getSections() async {
    return await _firebaseDatabase.collection('sections').get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSpeciesBySection(
      String sectionName) async {
    return await _firebaseDatabase
        .collection('species')
        .where('section.title', isEqualTo: sectionName)
        .get();
  }
}
