import 'package:hadrmouthamza/core/widgets/input_form_field.dart';
import 'package:hadrmouthamza/core/widgets/loading_circle.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/data/models/delivery.dart';
import 'package:hadrmouthamza/features/cart/data/models/radio_model.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildConfirmOrder extends StatelessWidget {
  const BuildConfirmOrder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    if(context.watch<CartBloc>().selectedMethod ==null){
      context.watch<CartBloc>().selectedMethod =
      context.watch<CartBloc>().orderMethod[0];}
    print(context.watch<CartBloc>().selectedMethod?.title);
    return SizedBox(
      width: 500.0,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: [
              Form(
                key: context.read<CartBloc>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    Gap(10),
                    Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        "اختر نوع الطلب",
                        style: AppTextStyles.font20BlackSemiBold,
                      ),
                    ),
                    Gap(10),
                    Row(
                      children: List.generate(
                        context.watch<CartBloc>().orderMethod.length,
                        (index) {
                          return Container(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Radio<bool>(
                                  value: context
                                      .watch<CartBloc>()
                                      .orderMethod[index]
                                      .active,
                                  groupValue: true,
                                  onChanged: (value) {
                                    context
                                        .read<CartBloc>()
                                        .selectMethod(value!, index);
                                  },
                                ),
                                Text(
                                  context
                                      .watch<CartBloc>()
                                      .orderMethod[index]
                                      .title,
                                  style: AppTextStyles.font14BlackSemiBold,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(10),
                    InputFormField(
                      controller: context.read<CartBloc>().dateController,
                      onTap: () {
                        print("object");
                        context.read<CartBloc>().onSelectDate(context);
                      },
                      readOnly: true,
                      hint: "تاريخ الحجز",
                      isNumber: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "برجاء ادخال تاريخ الحجز";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Gap(10),
                    if (context.watch<CartBloc>().selectedMethod?.title ==
                        "التوصيل الي البيت")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greyOp100,
                            ),
                            child: DropdownButton<DeliveryModel>(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              hint: const Text(
                                'اختر منطقة التوصيل',
                                style: AppTextStyles.font20BlackOp25Medium,
                              ),
                              dropdownColor: AppColors.greyOp100,
                              underline: const SizedBox.shrink(),
                              focusColor: AppColors.blackOp10,
                              value: context.watch<CartBloc>().selectedDelivery,
                              onChanged: (DeliveryModel? newValue) {
                                context.read<CartBloc>().selectModel(newValue!);
                              },
                              items: context
                                  .read<CartBloc>()
                                  .deliveryList
                                  .map<DropdownMenuItem<DeliveryModel>>(
                                      (DeliveryModel model) {
                                return DropdownMenuItem<DeliveryModel>(
                                  value: model,
                                  child: Text(
                                    "${model.title}      (مصاريف التوصيل ${model.fees}EGP)",
                                    style: AppTextStyles.font16BlackSemiBold,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          InputFormField(
                            controller:
                                context.read<CartBloc>().addressController,
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
                                controller:
                                    context.read<CartBloc>().buildingController,
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
                                controller:
                                    context.read<CartBloc>().floorController,
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
                                controller: context
                                    .read<CartBloc>()
                                    .apartmentController,
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
                        ],
                      ),
                    const Gap(16.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        context.read<CartBloc>().selectedDelivery != null
                            ? 'اجمالي المبلغ : ${context.read<CartBloc>().selectedDelivery!.fees + context.read<CartBloc>().totalCost}EGP'
                            : 'اجمالي المبلغ : ${context.read<CartBloc>().totalCost}EGP',
                        style: AppTextStyles.font16BlackSemiBold,
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 60,
                      child: BlocConsumer<CartBloc, CartState>(
                        listener: (context, state) {
                          if (state is AddOrderCartSuccess) {
                            if (context.mounted) {
                              context.pop();
                            }
                          }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () async {
                              await context.read<CartBloc>().addOrder(context);
                            },
                            style:
                                AppButtonStyles.buttonYellowSize135x52Rounded10,
                            child: state is AddOrderCartLoading
                                ? const LoadingSpinningCircle(
                                    color: AppColors.whiteOp100,
                                  )
                                : const Text(
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
      ),
    );
  }
}
