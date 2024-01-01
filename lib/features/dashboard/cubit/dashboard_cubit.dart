import 'package:hadrmouthamza/core/common/models/client.dart';
import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../data/repository/dashboard_repository.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Cubit<DashboardState> {
  final DashboardRepository _dashboardRepository;
  DashboardBloc(
    this._dashboardRepository,
  ) : super(DashboardInitial());

  static DashboardBloc get(context) => BlocProvider.of<DashboardBloc>(context);

  late List<OrderModel> _orders = [];
  List<OrderModel> get orders => _orders;
  late String errorMessage;

  Future<void> getOrders() async {
    final orders = await _dashboardRepository.getOrders();
    orders.isEmpty ? errorMessage = 'No data' : _orders = orders;
  }

  Future<void> addOrder() async {
    var order = OrderModel(
      id: '',
      cancelled: false,
      client: const ClientModel(
        uid: '2',
        name: 'احمد شهاوي',
        number: 01246845852,
        address: '8 شارع البلح جمب البنزينة',
        building: '4',
        floor: '5',
        apartment: '25',
      ),
      confirmed: false,
      deliveryFees: 20,
      delivered: false,
      price: 7000,
      createdAt: DateTime.now().toIso8601String(),
      species: const [
        SpeciesModel(
          id: 'id',
          title: 'نص فرخة مشوية',
          price: 120,
          createdAt: 'createdAt',
          section: SectionModel(id: 'id', title: 'قسم الدجاج'),
        ),
      ],
      dishes: null,
    );

    await _dashboardRepository.addOrder(order);
  }
}
