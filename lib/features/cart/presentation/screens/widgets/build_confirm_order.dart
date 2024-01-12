import 'package:hadrmouthamza/core/widgets/input_form_field.dart';
import 'package:hadrmouthamza/core/widgets/loading_circle.dart';
import 'package:hadrmouthamza/features/cart/cubit/cart_cubit.dart';
import 'package:hadrmouthamza/features/cart/data/models/delivery.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class BuildConfirmOrder extends StatelessWidget {
  const BuildConfirmOrder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    if (context.watch<CartBloc>().selectedMethod == null) {
      context.watch<CartBloc>().selectedMethod =
          context.watch<CartBloc>().orderMethod[0];
    }
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SizedBox(
        width: 0.8.sw,
        child: SingleChildScrollView(
          child: Form(
            key: context.read<CartBloc>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'أكمل بياناتك',
                  style: AppTextStyles.font32BlackBold.copyWith(
                    fontSize: ResponsiveValue<double>(
                      context,
                      defaultValue: 28,
                      conditionalValues: [
                        Condition.smallerThan(value: 24, name: DESKTOP)
                      ],
                    ).value!,
                  ),
                ),
                const Gap(8),
                InputFormField(
                  controller: context.read<CartBloc>().nameController,
                  hint: "الاسم بالكامل",
                  validator: (value) {
                    if (value == null || value.toString().trim().isEmpty) {
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
                    if (value == null || value.toString().trim().isEmpty) {
                      return "برجاء ادخال رقم الهاتف";
                    }
                    try {
                      double.parse(value);
                      return null;
                    } catch (e) {
                      return "من فضلك ادخل ارقام فقط";
                    }
                  },
                ),
                const Gap(4),
                Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "طريقة الاستلام",
                    style: AppTextStyles.font20BlackSemiBold.copyWith(
                      fontSize: ResponsiveValue<double>(
                        context,
                        defaultValue: 18,
                        conditionalValues: [
                          Condition.smallerThan(value: 16, name: DESKTOP)
                        ],
                      ).value!,
                    ),
                  ),
                ),
                const Gap(0),
                Column(
                  children: List.generate(
                    context.watch<CartBloc>().orderMethod.length,
                    (index) {
                      return Row(
                        children: [
                          Radio<bool>(
                            splashRadius: 0,
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
                            context.watch<CartBloc>().orderMethod[index].title,
                            style: AppTextStyles.font14BlackSemiBold,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Gap(0),
                Row(
                  children: [
                    Expanded(
                      child: InputFormField(
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
                    ),
                    const Gap(10),
                    Expanded(
                      child: InputFormField(
                        controller: context.read<CartBloc>().timeController,
                        onTap: () {
                          print("object");
                          context.read<CartBloc>().onSelectTime(context);
                        },
                        readOnly: true,
                        hint: "وقت الحجز",
                        isNumber: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "برجاء ادخال وقت الحجز";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const Gap(4),
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
                        height: 50,
                        child: DropdownButton<DeliveryModel>(
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          hint: Text(
                            'اختر منطقة التوصيل',
                            style: AppTextStyles.font20BlackOp25Medium.copyWith(
                              fontSize: ResponsiveValue<double>(
                                context,
                                defaultValue: 18,
                                conditionalValues: [
                                  Condition.smallerThan(value: 14, name: DESKTOP)
                                ],
                              ).value!,
                            ),
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
                                style: AppTextStyles.font16BlackSemiBold.copyWith(
                                  fontSize: ResponsiveValue<double>(
                                    context,
                                    defaultValue: 16,
                                    conditionalValues: [
                                      Condition.smallerThan(
                                          value: 12, name: DESKTOP)
                                    ],
                                  ).value!,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const Gap(4),
                      InputFormField(
                        controller: context.read<CartBloc>().addressController,
                        hint: "العنوان بالتفصيل",
                        validator: (value) {
                          if (value == null || value.toString().trim().isEmpty) {
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
                              if (value.isNotEmpty) {
                                try {
                                  double.parse(value);
                                  return null;
                                } catch (e) {
                                  return "من فضلك ادخل ارقام فقط";
                                }
                              }
                              return null;
                            },
                          )),
                          const Gap(10),
                          Expanded(
                              child: InputFormField(
                            controller: context.read<CartBloc>().floorController,
                            hint: "الدور",
                            isNumber: true,
                            validator: (value) {
                              if (value.isNotEmpty) {
                                try {
                                  double.parse(value);
                                  return null;
                                } catch (e) {
                                  return "من فضلك ادخل ارقام فقط";
                                }
                              }
                              return null;
                            },
                          )),
                          const Gap(10),
                          Expanded(
                              child: InputFormField(
                            controller:
                                context.read<CartBloc>().apartmentController,
                            hint: "الشقة",
                            isNumber: true,
                            validator: (value) {
                              if (value.isNotEmpty) {
                                try {
                                  double.parse(value);
                                  return null;
                                } catch (e) {
                                  return "من فضلك ادخل ارقام فقط";
                                }
                              }
                              return null;
                            },
                          )),
                        ],
                      ),
                    ],
                  ),
                const Gap(6),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    context.read<CartBloc>().selectedDelivery != null
                        ? 'اجمالي المبلغ : ${context.read<CartBloc>().selectedDelivery!.fees + context.read<CartBloc>().totalCost}EGP'
                        : 'اجمالي المبلغ : ${context.read<CartBloc>().totalCost}EGP',
                    style: AppTextStyles.font20BlackSemiBold.copyWith(
                      fontSize: ResponsiveValue<double>(
                        context,
                        defaultValue: 20,
                        conditionalValues: [
                          Condition.smallerThan(value: 16, name: DESKTOP)
                        ],
                      ).value!,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: ResponsiveValue<double>(
                    context,
                    defaultValue: 60,
                    conditionalValues: [
                      Condition.smallerThan(value: 45, name: DESKTOP)
                    ],
                  ).value!,
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
                        style: AppButtonStyles.buttonYellowSize135x52Rounded10,
                        child: state is AddOrderCartLoading
                            ? const LoadingSpinningCircle(
                                color: AppColors.whiteOp100,
                              )
                            : Text(
                                'تاكيد الطلب',
                                style: AppTextStyles.font20WhiteSemiBold.copyWith(
                                  fontSize: ResponsiveValue<double>(
                                    context,
                                    defaultValue: 20,
                                    conditionalValues: [
                                      Condition.smallerThan(
                                          value: 16, name: DESKTOP)
                                    ],
                                  ).value!,
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
