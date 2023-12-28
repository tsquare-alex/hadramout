import '../data_source/feature_data_source.dart';

class FeatureDataRepository {
  final FeatureDataSource _featureApiDataSource;

  FeatureDataRepository(this._featureApiDataSource);

  void yourFunction() {
    _featureApiDataSource.yourGetDataFunction();
  }
}
