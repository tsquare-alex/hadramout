import 'package:hadrmouthamza/core/helpers/generic_bloc/generic_cubit.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/widgets/build_confirm_order.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class CartScreenData {
  GenericBloc<bool> detailsCubit = GenericBloc(false);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void showCustomDialog(BuildContext context) {
    showDialog(

      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          content: BuildConfirmOrder(data: this,),
        );
      },
    );}

}
