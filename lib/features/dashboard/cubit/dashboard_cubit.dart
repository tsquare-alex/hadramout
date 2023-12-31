import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadrmouthamza/core/common/models/client.dart';
import 'package:hadrmouthamza/core/common/models/order.dart';

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

  final _db = FirebaseFirestore.instance;
  final List<OrderModel> _orders = [];
  late String errorMessage;

  Future<void> getOrders() async {
    final data = await _db.collection('orders').get();
    if (data.docs.isEmpty) {
      errorMessage = 'No data';
    } else {
      for (var e in data.docs) {
        _orders.add(OrderModel.fromJson(e.data()));
      }
    }
  }

  Future<void> addOrder() async {
    var client = const ClientModel(
      id: '2',
      name: 'shahawy',
      number: 05804804,
      address: 'asdjnuahsd',
      building: '4',
      floor: '2',
      apartment: '12',
    );
    var order = OrderModel(
      id: '1',
      cancelled: false,
      client: client,
      confirmed: false,
      deliveryFees: 20,
      delivered: false,
      price: 7000,
    );

    final data = await _db.collection('orders').add(order.toJson());
  }
}
