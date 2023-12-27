import 'bloc/your_details_tab_container_bloc.dart';
import 'models/your_details_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'package:hadrmouthamza/core/app_export.dart';
import 'package:hadrmouthamza/presentation/your_details_page/your_details_page.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_title.dart';
import 'package:hadrmouthamza/widgets/app_bar/appbar_trailing_image.dart';
import 'package:hadrmouthamza/widgets/app_bar/custom_app_bar.dart';

class YourDetailsTabContainerScreen extends StatefulWidget {
  const YourDetailsTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  YourDetailsTabContainerScreenState createState() =>
      YourDetailsTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return BlocProvider<YourDetailsTabContainerBloc>(
      create: (context) =>
          YourDetailsTabContainerBloc(YourDetailsTabContainerState(
        yourDetailsTabContainerModelObj: YourDetailsTabContainerModel(),
      ))
            ..add(YourDetailsTabContainerInitialEvent()),
      child: YourDetailsTabContainerScreen(),
    );
  }
}

class YourDetailsTabContainerScreenState
    extends State<YourDetailsTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YourDetailsTabContainerBloc,
        YourDetailsTabContainerState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
              width: SizeUtils.width,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 11.v),
                child: Column(
                  children: [
                    _buildTabview(context),
                    SizedBox(
                      height: 740.v,
                      child: TabBarView(
                        controller: tabviewController,
                        children: [
                          YourDetailsPage(),
                          YourDetailsPage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "msg42".tr,
        margin: EdgeInsets.only(left: 182.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgArrowLeft,
          margin: EdgeInsets.fromLTRB(16.h, 18.v, 16.h, 24.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 59.v,
      width: 398.h,
      decoration: BoxDecoration(
        color: appTheme.gray2007f,
        borderRadius: BorderRadius.circular(
          10.h,
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        labelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: appTheme.black900.withOpacity(0.5),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
        ),
        indicatorPadding: EdgeInsets.all(
          9.0.h,
        ),
        indicator: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            5.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl70".tr,
            ),
          ),
          Tab(
            child: Text(
              "msg43".tr,
            ),
          ),
        ],
      ),
    );
  }
}
