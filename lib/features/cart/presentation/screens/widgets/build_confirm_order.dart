import 'package:hadrmouthamza/core/widgets/input_form_field.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen_data.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildConfirmOrder extends StatelessWidget {
  const BuildConfirmOrder({super.key, required this.data});
  final CartScreenData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'أكمل بياناتك',
                  style: AppTextStyles.font32BlackBold,
                ),
                SizedBox(height: 16.0),
                InputFormField(controller: data.nameController,hasLabel: true,hint: "الاسم بالكامل",),
                InputFormField(controller: data.phoneController,hasLabel: true,hint: "رقم الهاتف"),
                InputFormField(controller: data.phoneController,hasLabel: true,hint: "العنوان بالتفصيل"),
                Row(
                  children: [
                    Expanded(child: InputFormField(controller: data.nameController,hasLabel: true,hint: "العمارة",)),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child: InputFormField(controller: data.nameController,hasLabel: true,hint: "الدور",)),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(child: InputFormField(controller: data.nameController,hasLabel: true,hint: "الشقة",)),
                  ],
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  width: 180,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.yellowOp100,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text('تاكيد الطلب',style: AppTextStyles.font20WhiteSemiBold,),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 450,
              child: InkWell(
                onTap: (){
                  context.pop();
                },
                child: Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.whiteOp100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
