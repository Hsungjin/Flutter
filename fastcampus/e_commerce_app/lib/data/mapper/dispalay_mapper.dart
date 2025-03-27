
import '../../domain/model/display/menu/menu_model.dart';
import '../../domain/model/display/view_module/view_module_model.dart';

import '../dto/display/display_dto.dart';

extension MenuX on MenuDto {
  MenuModel toModel() {
    return MenuModel(tabId: tabId ?? -1, title: title ?? '');
  }
}
extension ViewModuleX on ViewModuleDto {
  ViewModuleModel toModel() {
    return ViewModuleModel(type: type ?? '', title: title ?? '', subTitle: subTitle ?? '', imageUrl: imageUrl ?? '');
  }
}