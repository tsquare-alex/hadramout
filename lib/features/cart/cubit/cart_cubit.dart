import 'dart:convert';
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:hadrmouthamza/core/common/models/client.dart';
import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/core/utils/custom_toast.dart';
import 'package:hadrmouthamza/features/cart/data/models/cart.dart';
import 'package:hadrmouthamza/features/cart/data/models/delivery.dart';
import 'package:hadrmouthamza/features/cart/data/models/radio_model.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_confirm_order.dart';
import 'package:hadrmouthamza/src/app_export.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../data/repository/cart_repository.dart';

part 'cart_state.dart';

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
    ).then((time) {
      orderTime = time!;
      onConfirm(
          DateTime(now.year, now.month, now.day, time!.hour, time.minute));
    });
  }

  DateTime? orderDate;
  TimeOfDay? orderTime;

  String? time;
  void onSelectTime(
    BuildContext context,
  ) {
    FocusScope.of(context).requestFocus(FocusNode());
    timePicker(
        context: context,
        onConfirm: (date) {
          time = DateFormat("mm:hh aa", "en").format(date!);
          timeController.text = DateFormat("mm:hh aa", "ar").format(date!);
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
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((DateTime? date) {
      orderDate = date!;
      dateController.text = DateFormat("dd MMMM yyyy", "ar").format(orderDate!);
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
            total: totalCost + selectedDelivery!.fees,
            subTotal: totalCost ,
            createdAt: DateTime.now().toIso8601String(),
            cartModel: cartList,
            deliveryModel: selectedDelivery!,
            orderDate: orderDate!,
            orderMethod: selectedMethod!.title,
            orderTime: time!,
          );
          await _cartRepository.addOrder(orderModel);
          //sendOrderConfirmationEmail(orderModel);
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
          total: totalCost,
          subTotal: totalCost,
          createdAt: DateTime.now().toIso8601String(),
          cartModel: cartList,
          orderDate: orderDate!,
          orderMethod: selectedMethod!.title,
          orderTime: time!,
        );
        await _cartRepository.addOrder(orderModel);
        //sendOrderConfirmationEmail(orderModel);
      }
      cartList = [];
      emit(AddOrderCartSuccess());
      clearData();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove("cartList");
    }
  }

  // Future<void> sendOrderConfirmationEmail(OrderModel order) async {
  //   final cloudFunctionUrl = 'YOUR_CLOUD_FUNCTION_URL'; // Replace with your Cloud Function URL
  //
  //   final response = await http.post(
  //     Uri.parse(cloudFunctionUrl),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({
  //       'to': 'your@gmail.com', // Replace with your email address
  //       'subject': 'Order Confirmation - #${order.id}',
  //       'html': '<h1>Order Confirmation</h1>'
  //           '<p>Your order details:</p>'
  //           '<p>Order Number: ${order.id}</p>'
  //           '<p>Total Amount: \$${order.price}</p>'
  //           '<p>Items: ${order.cartModel.join(', ')}</p>',
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     print('Email sent successfully');
  //   } else {
  //     print('Error sending email: ${response.body}');
  //   }
  // }

  Future<void> sendOrderConfirmationEmail(OrderModel order) async {
    final smtpServer = gmail('hadrmout3@gmail.com', 'Hadrmout@1234');

    // Create the email message.
    final message = Message()
      ..from = const Address('hadrmout3@gmail.com', 'Hadrmout Hamza')
      ..recipients.add('01550526487m@gmail.com') // Replace with the customer's email
      ..subject = 'Order Confirmation - #${order.id}'
      ..html = '<h1>The order details:</h1>'
          '<p>Order id: ${order.id}</p>'
          '<p>Order canceled: \$${order.cancelled}</p>'
          '<p>Items: ${order.cartModel.join(', ')}</p>';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. Error: $e');
    }
  }

  clearData() {
    nameController.clear();
    numberController.clear();
    addressController.clear();
    floorController.clear();
    apartmentController.clear();
    buildingController.clear();
    dateController.clear();
    timeController.clear();
    selectedDelivery = null;
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
