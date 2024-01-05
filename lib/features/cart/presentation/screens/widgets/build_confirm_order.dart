import 'package:hadrmouthamza/core/widgets/input_form_field.dart';
import 'package:hadrmouthamza/core/widgets/loading_circle.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/presentation/screens/cart_screen_data.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildConfirmOrder extends StatelessWidget {
  const BuildConfirmOrder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500.0,
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Form(
              key: context.read<CartBloc>().formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'أكمل بياناتك',
                    style: AppTextStyles.font32BlackBold,
                  ),
                  const SizedBox(height: 16.0),
                  InputFormField(
                    controller: context.read<CartBloc>().nameController,
                    hint: "الاسم بالكامل",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "برجاء ادخال الاسم";
                      } else {
                        return null;
                      }
                    },
                  ),
                  InputFormField(
                    controller: context.read<CartBloc>().numberController,
                    hint: "رقم الهاتف",
                    isNumber: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "برجاء ادخال رقم الهاتف";
                      } else {
                        return null;
                      }
                    },
                  ),
                  InputFormField(
                    controller: context.read<CartBloc>().addressController,
                    hint: "العنوان بالتفصيل",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "برجاء ادخال العنوان";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: InputFormField(
                        controller: context.read<CartBloc>().buildingController,
                        hint: "العمارة",
                        isNumber: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'برجاء ادخال رقم العمارة';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: InputFormField(
                        controller: context.read<CartBloc>().floorController,
                        hint: "الدور",
                        isNumber: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "برجاء ادخال رقم الدور";
                          } else {
                            return null;
                          }
                        },
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: InputFormField(
                        controller:
                            context.read<CartBloc>().apartmentController,
                        hint: "الشقة",
                        isNumber: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "برجاء ادخال رقم الشقة";
                          } else {
                            return null;
                          }
                        },
                      )),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 180,
                    height: 60,
                    child: BlocConsumer<CartBloc, CartState>(
                      listener: (context,state){
                        if(state is AddOrderCartSuccess){
                          if(context.mounted){
                            context.pop();
                          }
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () async {
                            await context.read<CartBloc>().addOrder(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.yellowOp100,
                            onPrimary: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: state is AddOrderCartLoading
                              ? LoadingSpinningCircle(
                                  color: AppColors.whiteOp100,
                                )
                              : Text(
                                  'تاكيد الطلب',
                                  style: AppTextStyles.font20WhiteSemiBold,
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 500,
            //   child: InkWell(
            //     onTap: () {
            //       context.pop();
            //     },
            //     child: Container(
            //       width: 50,
            //       height: 50,
            //       padding: EdgeInsets.all(3),
            //       decoration: BoxDecoration(
            //         color: AppColors.whiteOp100,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: Center(
            //         child: Icon(Icons.close),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
