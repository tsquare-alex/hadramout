import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:hadrmouthamza/core/common/models/client.dart';
import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/core/utils/custom_toast.dart';
import 'package:hadrmouthamza/features/cart/data/models/cart.dart';
import 'package:hadrmouthamza/features/cart/data/models/delivery.dart';
import 'package:hadrmouthamza/features/cart/data/models/radio_model.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_confirm_order.dart';
import 'package:hadrmouthamza/src/app_export.dart';
import 'package:intl/intl.dart';
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

  timePicker(
      {required BuildContext context,
      required String title,
      required Function(DateTime? date) onConfirm}) async {
    var now = DateTime.now();
    showRoundedTimePicker(
      context: context,
      locale: const Locale('en', 'US'),
      theme: ThemeData(
        primaryColor: AppColors.whiteOp100,
        colorScheme: const ColorScheme.light(
            background: AppColors.whiteOp100,
            onSurface: AppColors.blackOp100,
            primary: AppColors.yellowOp100),
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
      initialTime: TimeOfDay.now(),
    ).then((time){
      orderTime = time!;
      onConfirm(
          DateTime(now.year, now.month, now.day, time!.hour, time.minute));
    }
    );
  }

  DateTime? orderDate;
  TimeOfDay? orderTime;

  _androidTimePicker(
      BuildContext context, Function(DateTime date) onConfirm) {
    var now = DateTime.now();
    showRoundedTimePicker(
      context: context,
      locale: const Locale('en', 'US'),
      theme: ThemeData(
        primaryColor: AppColors.whiteOp100,
        colorScheme: const ColorScheme.light(
            background: AppColors.whiteOp100,
            onSurface: AppColors.blackOp100,
            primary: AppColors.yellowOp100),
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
      ),
      initialTime: TimeOfDay.now(),
    ).then((time){
      orderTime = time!;
      onConfirm(
          DateTime(now.year, now.month, now.day, time!.hour, time.minute));
    }
    );
  }

  void onSelectTime(
    BuildContext context,
  ) {
    FocusScope.of(context).requestFocus(FocusNode());
    timePicker(
        context: context,
        onConfirm: (date) {
          timeController.text = DateFormat("hh:mm aa", "en").format(date!);
        },
        title: '');
  }

  void onSelectDate(
    BuildContext context,
  ) {
    showDatePicker(
      context: context,
      locale: const Locale("ar"),
      initialDate: DateTime.now(),
      firstDate: DateTime.now().add(const Duration(days: -1)),
      lastDate: DateTime(2050),
    ).then((DateTime? date) {
      orderDate = date!;
      dateController.text = DateFormat("dd MMMM yyyy", "en").format(orderDate!);
    });
  }

  DeliveryModel? selectedDelivery;

  List<DeliveryModel> deliveryList = [
    const DeliveryModel(title: "المعادي", fees: 20),
    const DeliveryModel(title: "الجيزة", fees: 30),
    const DeliveryModel(title: "القاهرة", fees: 40),
    const DeliveryModel(title: "الاسماعيلية", fees: 55),
  ];

  RadioModel? selectedMethod;

  List<RadioModel> orderMethod = [
    RadioModel(
      title: "التوصيل الي البيت",
      active: true,
    ),
    RadioModel(
      title: "حجز بالمطعم",
      active: false,
    ),
  ];

  selectMethod(bool value, int index) {
    emit(SelectMethodLoading());
    orderMethod.map((e) => e.active = false).toList();
    orderMethod[index].active = !value;
    selectedMethod = orderMethod[index];
    emit(SelectMethodSuccess());
  }

  selectModel(DeliveryModel newDelivery) {
    emit(SelectDeliveryLoading());
    selectedDelivery = newDelivery;
    emit(SelectDeliverySuccess());
  }

  Future<void> addOrder(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(AddOrderCartLoading());
      var userData = await FirebaseAuth.instance.signInAnonymously();
      if (selectedMethod?.title == "التوصيل الي البيت") {
        if (selectedDelivery != null) {
          var orderModel = OrderModel(
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
            price: totalCost + selectedDelivery!.fees,
            createdAt: DateTime.now().toIso8601String(),
            cartModel: cartList,
            deliveryModel: selectedDelivery!,
            orderDate: orderDate!,
            orderMethod: selectedMethod!.title,
            orderTime: timeController.text,
          );
          await _cartRepository.addOrder(orderModel);
        } else if (selectedDelivery == null) {
          CustomToast.showSimpleToast(
            msg: "برجاء اختر مكان التوصيل",
            color: Colors.red,
          );
          return;
        }
      } else if (selectedMethod?.title == "حجز بالمطعم") {
        print(selectedMethod?.title);
        var orderModel = OrderModel(
          id: '',
          cancelled: false,
          client: ClientModel(
            uid: userData.user!.uid,
            name: nameController.text,
            number: int.parse(numberController.text),
          ),
          confirmed: false,
          delivered: false,
          price: totalCost,
          createdAt: DateTime.now().toIso8601String(),
          cartModel: cartList,
          orderDate: orderDate!,
          orderMethod: selectedMethod!.title,
          orderTime: timeController.text,
        );
        await _cartRepository.addOrder(orderModel);
      }
      cartList = [];
      emit(AddOrderCartSuccess());
      clearData();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("cartList");
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
    emit(AddToCartLoading());
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
    emit(AddToCartSuccess());
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
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          surfaceTintColor: Colors.white,
          content: BuildConfirmOrder(),
        );
      },
    );
  }
}
