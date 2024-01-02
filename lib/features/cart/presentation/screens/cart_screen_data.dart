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
          backgroundColor: Colors.white,
          content: BuildConfirmOrder(data: this,),
        );
      },
    );}

}
