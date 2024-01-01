import 'package:hadrmouthamza/core/common/models/client.dart';
import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/src/app_export.dart';

import '../../../core/common/models/dishes.dart';
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

  late List<DishesModel> _dishes = [];

  List<DishesModel> get dishes => _dishes;

  late List<SectionModel> _sections = [];

  List<SectionModel> get sections => _sections;

  late List<SpeciesModel> _species = [];

  List<SpeciesModel> get species => _species;
  late String errorMessage;

  //todo Order's Method
  Future<void> getOrders() async {
    emit(GetOrderDashboardLoading());
    final orders = await _dashboardRepository.getOrders();
    // orders.isEmpty ? errorMessage = 'No data' : _orders = orders;
    if (orders.isEmpty) {
      emit(GetOrderDashboardError(errorMessage: 'No data'));
    } else {
      _orders = orders;
      emit(GetOrderDashboardSuccess());
    }
  }

  Future<void> addOrder() async {
    emit(AddOrderDashboardLoading());
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
    emit(AddOrderDashboardSuccess());
  }

  //Todo Dishes's Method

  Future<void> getDishes() async {
    emit(GetDishDashboardLoading());
    final dishes = await _dashboardRepository.getDishes();
    // dishes.isEmpty ? errorMessage = 'No data' : _dishes = dishes;
    if (dishes.isEmpty) {
      emit(GetDishDashboardError(errorMessage: "'No data'"));
    } else {
      emit(GetDishDashboardSuccess());
    }
  }

  Future<void> addDish() async {
    emit(AddDishDashboardLoading());
    var dish = DishesModel(
      id: "",
      title: "Welcome Dish",
      description: "Montaser & Shahawy Created amazing Dish",
      image:
          "https://img.freepik.com/free-photo/beautiful-sea-ocean-with-cloud-blue-sky_74190-6828.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704067200&semt=ais",
      price: 90000000000,
      createdAt: DateTime.now().toString(),
      section: SectionModel(id: "id", title: "Chicken"),
      offer: false,
      offerValue: 20,
    );
    await _dashboardRepository.addDish(dish);
    emit(AddDishDashboardSuccess());
  }

  //Todo Dishes's Method

  Future<void> getSections() async {
    emit(GetSectionDashboardLoading());
    final sections = await _dashboardRepository.getSections();
    // dishes.isEmpty ? errorMessage = 'No data' : _dishes = dishes;
    if (sections.isEmpty) {
      emit(GetSectionDashboardError(errorMessage: "'No data'"));
    } else {
      emit(GetSectionDashboardSuccess());
    }
  }

  Future<void> addSection() async {
    emit(AddSectionDashboardLoading());
    var section = SectionModel(id: "id", title: "Section");
    await _dashboardRepository.addSection(section);
    emit(AddSectionDashboardSuccess());
  }

  //Todo Species Method

  Future<void> getSpecies() async {
    emit(GetSpeciesDashboardLoading());
    final species = await _dashboardRepository.getSpecies();
    // dishes.isEmpty ? errorMessage = 'No data' : _dishes = dishes;
    if (species.isEmpty) {
      emit(GetSpeciesDashboardError(errorMessage: "'No data'"));
    } else {
      emit(GetSpeciesDashboardSuccess());
    }
  }

  Future<void> addSpecies() async {
    emit(AddSpeciesDashboardLoading());
    var section = SpeciesModel(
        id: "id",
        title: "New Meals",
        price: 30099,
        createdAt: DateTime.now().toIso8601String(),
        section: SectionModel(
          id: "",
          title: "New Meals"
        ));
    await _dashboardRepository.addSpecies(section);
    emit(AddSpeciesDashboardSuccess());
  }
}
