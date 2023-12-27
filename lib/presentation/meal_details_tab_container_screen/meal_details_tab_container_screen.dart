import 'bloc/meal_details_tab_container_bloc.dart';
import 'models/meal_details_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/presentation/meal_details_page/meal_details_page.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_subtitle.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_title_button_one.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hadrmouthamza/widgets/app_bar/custom_app_bar.dart';

class MealDetailsTabContainerScreen extends StatefulWidget {
  const MealDetailsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  MealDetailsTabContainerScreenState createState() =>
      MealDetailsTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<MealDetailsTabContainerBloc>(
      create: (context) =>
          MealDetailsTabContainerBloc(MealDetailsTabContainerState(
        mealDetailsTabContainerModelObj: MealDetailsTabContainerModel(),
      ))
            ..add(MealDetailsTabContainerInitialEvent()),
      child: MealDetailsTabContainerScreen(),
    );
  }
}

class MealDetailsTabContainerScreenState
    extends State<MealDetailsTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailsTabContainerBloc,
        MealDetailsTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 36.v),
                  _buildTf(context),
                  SizedBox(height: 32.v),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTabview(context),
                          SizedBox(
                            height: 980.v,
                            child: TabBarView(
                              controller: tabviewController,
                              children: [
                                MealDetailsPage(),
                                MealDetailsPage(),
                                MealDetailsPage(),
                                MealDetailsPage(),
                                MealDetailsPage(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildTf(BuildContext context) {
    return SizedBox(
      height: 338.v,
      width: 398.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img83x77,
            height: 292.v,
            width: 270.h,
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 13.v),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 218.v,
              width: 316.h,
              decoration: BoxDecoration(
                color: appTheme.black900.withOpacity(0.05),
                borderRadius: BorderRadius.circular(
                  158.h,
                ),
              ),
            ),
          ),
          CustomAppBar(
            height: 38.v,
            title: AppbarTitleButtonOne(
              margin: EdgeInsets.only(left: 16.h),
            ),
            actions: [
              AppbarSubtitle(
                text: "lbl14".tr,
                margin: EdgeInsets.only(left: 16.h),
              ),
              AppbarTrailingImage(
                imagePath: ImageConstant.imgArrowLeft,
                margin: EdgeInsets.fromLTRB(16.h, 9.v, 16.h, 15.v),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return SizedBox(
      height: 36.v,
      width: 859.h,
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: appTheme.black900,
        labelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelColor: appTheme.black900.withOpacity(0.25),
        unselectedLabelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
        ),
        indicatorColor: theme.colorScheme.primary,
        tabs: [
          Tab(
            child: Text(
              "msg31".tr,
            ),
          ),
          Tab(
            child: Text(
              "msg32".tr,
            ),
          ),
          Tab(
            child: Text(
              "msg14".tr,
            ),
          ),
          Tab(
            child: Text(
              "msg30".tr,
            ),
          ),
          Tab(
            child: Text(
              "msg33".tr,
            ),
          ),
        ],
      ),
    );
  }
}
