import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/dashboard_repository.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Cubit<DashboardState> {
  final DashboardRepository _dashboardRepository;
  DashboardBloc(
    this._dashboardRepository,
  ) : super(DashboardInitial());

  static DashboardBloc get(context) => BlocProvider.of<DashboardBloc>(context);

  void yourFunction() {
    _dashboardRepository.yourFunction();
  }
}
