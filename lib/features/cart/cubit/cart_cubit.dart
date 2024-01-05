import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hadrmouthamza/core/common/models/client.dart';
import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/core/utils/custom_toast.dart';
import 'package:hadrmouthamza/features/cart/data/models/cart.dart';
import 'package:hadrmouthamza/features/cart/data/models/delivery.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_confirm_order.dart';
import 'package:hadrmouthamza/src/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/cart_repository.dart';

part 'cart_state.dart';

// List<CartModel> modelList=[];
bool included = false;

class CartBloc extends Cubit<CartState> {
  final CartRepository _cartRepository;
  CartBloc(
    this._cartRepository,
  ) : super(CartInitial());

  static CartBloc get(context) => BlocProvider.of<CartBloc>(context);

  DeliveryModel? selectedDelivery;

  List<DeliveryModel> deliveryList = [
    DeliveryModel(title: "المعادي", fees: 20),
    DeliveryModel(title: "الجيزة", fees: 30),
    DeliveryModel(title: "القاهرة", fees: 40),
    DeliveryModel(title: "الاسماعيلية", fees: 55),
  ];

  selectModel(DeliveryModel newDelivery) {
    emit(SelectDeliveryLoading());
    selectedDelivery = newDelivery;
    emit(SelectDeliverySuccess());
  }

  Future<void> addOrder(BuildContext context) async {
    if (formKey.currentState!.validate() && selectedDelivery != null) {
      emit(AddOrderCartLoading());
      var userData = await FirebaseAuth.instance.signInAnonymously();
      var order = OrderModel(
        id: '',
        cancelled: false,
        client: ClientModel(
          uid: userData.user!.uid,
          name: nameController.text,
          number: int.parse(numberController.text),
          address: addressController.text,
          building: buildingController.text,
          floor: floorController.text,
          apartment: apartmentController.text,
        ),
        confirmed: false,
        delivered: false,
        price: totalCost+selectedDelivery!.fees,
        createdAt: DateTime.now().toIso8601String(),
        cartModel: cartList,
        deliveryModel: selectedDelivery!,
      );
      await _cartRepository.addOrder(order);
      cartList = [];
      emit(AddOrderCartSuccess());
      clearData();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("cartList");
    } else {
      CustomToast.showSimpleToast(msg: "برجاء إكمال البيانات لتأكيد الطلب");
    }
  }

  clearData() {
    nameController.clear();
    numberController.clear();
    addressController.clear();
    floorController.clear();
    apartmentController.clear();
    buildingController.clear();
  }

  List<CartModel> cartList = [];

  Future<void> increment(CartModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String list = prefs.getString('cartList') ?? '[]';
    List<dynamic> jsonList = jsonDecode(list);
    List<CartModel> speciesList =
        jsonList.map((json) => CartModel.fromJson(json)).toList();
    CartModel targetModel =
        speciesList.firstWhere((element) => element.title == model.title);
    included = true;
    speciesList[speciesList.indexOf(targetModel)].quantity += 1;
    speciesList[speciesList.indexOf(targetModel)].totalPrice =
        speciesList[speciesList.indexOf(targetModel)].price *
            speciesList[speciesList.indexOf(targetModel)].quantity;
    print(speciesList[speciesList.indexOf(targetModel)].quantity);
    prefs.setString("cartList", jsonEncode(speciesList));
    fetchCartItems();
  }

  Future<void> decrement(CartModel model, int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String list = prefs.getString('cartList') ?? '[]';
    List<dynamic> jsonList = jsonDecode(list);
    List<CartModel> speciesList =
        jsonList.map((json) => CartModel.fromJson(json)).toList();
    CartModel targetModel =
        speciesList.firstWhere((element) => element.title == model.title);
    included = true;
    if (model.quantity != 1) {
      speciesList[speciesList.indexOf(targetModel)].quantity -= 1;
      speciesList[speciesList.indexOf(targetModel)].totalPrice =
          speciesList[speciesList.indexOf(targetModel)].price *
              speciesList[speciesList.indexOf(targetModel)].quantity;
      print(speciesList[speciesList.indexOf(targetModel)].quantity);
      prefs.setString("cartList", jsonEncode(speciesList));
      fetchCartItems();
    } else {
      speciesList.removeAt(speciesList.indexOf(targetModel));
      prefs.setString("cartList", jsonEncode(speciesList));
      fetchCartItems();
    }
  }

  Future<void> addToCart(SpeciesModel model) async {
    CartModel newCartModel = CartModel(
      title: model.title,
      description: model.description,
      image: model.image,
      price: model.price,
      quantity: 1,
      totalPrice: model.price,
      section: model.section,
    );
    CartModel cartModel = cartList
            .any((element) => element.title == newCartModel.title)
        ? cartList.firstWhere((element) => element.title == newCartModel.title)
        : newCartModel;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (cartList.contains(cartModel)) {
      included = true;
      cartList[cartList.indexOf(cartModel)].quantity += 1;
      cartList[cartList.indexOf(cartModel)].totalPrice =
          cartList[cartList.indexOf(cartModel)].price *
              cartList[cartList.indexOf(cartModel)].quantity;
      print(cartList[cartList.indexOf(cartModel)].quantity);
      prefs.setString("cartList", jsonEncode(cartList));
      CustomToast.showSimpleToast(msg: "تمت الإضافة بنجاح");
    } else {
      included = false;
      cartList.add(cartModel);
      prefs.setString("cartList", jsonEncode(cartList));
      CustomToast.showSimpleToast(msg: "تمت الإضافة بنجاح");
    }
  }

  Future<void> fetchCartItems() async {
    emit(AddOrderSpeciesLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString('cartList') ?? '[]';
    List<dynamic> jsonList = jsonDecode(jsonString);
    cartList = jsonList.map((json) => CartModel.fromJson(json)).toList();
    print(cartList.length);

    emit(AddOrderSpeciesSuccess());
  }

  double get totalCost {
    var total = 0.0;
    for (CartModel model in cartList) {
      total += model.totalPrice;
    }
    return total;
  }

  final GlobalKey<FormState> formKey = GlobalKey();

  ScrollController pageScrollController = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController apartmentController = TextEditingController();

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          content: BuildConfirmOrder(),
        );
      },
    );
  }
}
