import 'package:flutter/material.dart';
import 'package:hadrmouthamza/presentation/home_bage_screen/home_bage_screen.dart';
import 'package:hadrmouthamza/presentation/pay_screen/pay_screen.dart';
import 'package:hadrmouthamza/presentation/coupon_code_screen/coupon_code_screen.dart';
import 'package:hadrmouthamza/presentation/payment_methods_screen/payment_methods_screen.dart';
import 'package:hadrmouthamza/presentation/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:hadrmouthamza/presentation/meal_details_tab_container_screen/meal_details_tab_container_screen.dart';
import 'package:hadrmouthamza/presentation/delete_itam_screen/delete_itam_screen.dart';
import 'package:hadrmouthamza/presentation/activation_code_screen/activation_code_screen.dart';
import 'package:hadrmouthamza/presentation/set_a_date_to_send_the_food_screen/set_a_date_to_send_the_food_screen.dart';
import 'package:hadrmouthamza/presentation/your_details_tab_container_screen/your_details_tab_container_screen.dart';
import 'package:hadrmouthamza/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String homeBageScreen = '/home_bage_screen';

  static const String payScreen = '/pay_screen';

  static const String couponCodeScreen = '/coupon_code_screen';

  static const String paymentMethodsScreen = '/payment_methods_screen';

  static const String shoppingCartScreen = '/shopping_cart_screen';

  static const String mealDetailsPage = '/meal_details_page';

  static const String mealDetailsTabContainerScreen =
      '/meal_details_tab_container_screen';

  static const String deleteItamScreen = '/delete_itam_screen';

  static const String activationCodeScreen = '/activation_code_screen';

  static const String setADateToSendTheFoodScreen =
      '/set_a_date_to_send_the_food_screen';

  static const String yourDetailsPage = '/your_details_page';

  static const String yourDetailsTabContainerScreen =
      '/your_details_tab_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        homeBageScreen: HomeBageScreen.builder,
        payScreen: PayScreen.builder,
        couponCodeScreen: CouponCodeScreen.builder,
        paymentMethodsScreen: PaymentMethodsScreen.builder,
        shoppingCartScreen: ShoppingCartScreen.builder,
        mealDetailsTabContainerScreen: MealDetailsTabContainerScreen.builder,
        deleteItamScreen: DeleteItamScreen.builder,
        activationCodeScreen: ActivationCodeScreen.builder,
        setADateToSendTheFoodScreen: SetADateToSendTheFoodScreen.builder,
        yourDetailsTabContainerScreen: YourDetailsTabContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: HomeBageScreen.builder
      };
}
