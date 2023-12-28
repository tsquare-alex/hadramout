import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/feature_data_repository.dart';

part 'demo_state.dart';

class DemoBloc extends Cubit<DemoState> {
  final FeatureDataRepository _featureDataRepository;
  DemoBloc(
    this._featureDataRepository,
  ) : super(DemoInitial());

  static DemoBloc get(context) => BlocProvider.of<DemoBloc>(context);

  void yourFunction() {
    _featureDataRepository.yourFunction();
  }
}
