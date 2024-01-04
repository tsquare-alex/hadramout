import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadrmouthamza/core/common/models/client.dart';
import 'package:hadrmouthamza/core/common/models/order.dart';
import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/core/utils/custom_toast.dart';
import 'package:hadrmouthamza/features/cart/data/models/cart.dart';
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

  Future<void> addOrder() async {
    emit(AddOrderCartLoading());
    var userData = await FirebaseAuth.instance.signInAnonymously();
    var order = OrderModel(
      id: '',
      cancelled: false,
      client: ClientModel(
        uid: userData.user!.uid,
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
      species: [
        SpeciesModel(
          id: 'id',
          title: 'نص فرخة مشوية',
          price: 120,
          createdAt: 'createdAt',
          section: SectionModel(id: 'id', title: 'قسم الدجاج'), offer: false,offerValue: 20,
        ),
      ],
    );
    await _cartRepository.addOrder(order);
    emit(AddOrderCartSuccess());
  }

  List<CartModel> cartList = [];

  Future<void> increment(SpeciesModel model) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String list = prefs.getString('yourSpeciesList') ?? '[]';
    List<dynamic> jsonList = jsonDecode(list);
    List<SpeciesModel> speciesList =
    jsonList.map((json) => SpeciesModel.fromJson(json)).toList();

  }

  Future<void> addToCart(SpeciesModel model) async {
    CartModel newCartModel = CartModel(title: model.title, description: model.description, image: model.image, price: model.price,quantity: 1,totalPrice: model.price);
    CartModel cartModel = cartList.any((element) => element.title == newCartModel.title)?
    cartList.firstWhere((element) => element.title == newCartModel.title):newCartModel;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(cartList.contains(cartModel)){
      included = true;
      cartList[cartList.indexOf(cartModel)].quantity +=1;
      cartList[cartList.indexOf(cartModel)].totalPrice =cartList[cartList.indexOf(cartModel)].price * cartList[cartList.indexOf(cartModel)].quantity;
      print(cartList[cartList.indexOf(cartModel)].quantity);
      prefs.setString("cartList", jsonEncode(cartList));
      CustomToast.showSimpleToast(msg: "تمت الإضافة بنجاح");
    }else{
      included = false;
      cartList.add(cartModel);
      prefs.setString("cartList", jsonEncode(cartList));
      CustomToast.showSimpleToast(msg: "تمت الإضافة بنجاح");
    }
  }

  Future<void> fetchCartItems() async {
    emit(AddOrderSpeciesLoading());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = prefs.getString('yourSpeciesList') ?? '[]';
    List<dynamic> jsonList = jsonDecode(jsonString);
    cartList = jsonList.map((json) => CartModel.fromJson(json)).toList();
    print(cartList.length);

    emit(AddOrderSpeciesSuccess());
  }

  double get totalCost{
    var total = 0.0;
    for(CartModel model in cartList){
      total+=model.totalPrice;
    }
    return total;
  }

}
