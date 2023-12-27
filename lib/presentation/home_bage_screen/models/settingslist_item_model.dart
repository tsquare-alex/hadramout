import '../../../core/app_export.dart';

/// This class is used in the [settingslist_item_widget] screen.
class SettingslistItemModel {
  SettingslistItemModel({
    this.settingsImage,
    this.settingsText,
    this.id,
  }) {
    settingsImage = settingsImage ?? ImageConstant.imgSettings;
    settingsText = settingsText ?? "إستلام سفرة";
    id = id ?? "";
  }

  String? settingsImage;

  String? settingsText;

  String? id;
}
