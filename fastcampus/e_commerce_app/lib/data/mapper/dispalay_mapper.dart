
import '../../domain/model/display/menu/menu_model.dart';
import '../dto/display/menu/menu_dto.dart';

extension MenuX on MenuDto {
  MenuModel toModel() {
    return MenuModel(tabId: tabId ?? -1, title: title ?? '');
  }
}