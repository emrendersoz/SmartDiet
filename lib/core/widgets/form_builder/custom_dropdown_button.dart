// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

enum CustomDropdownType {
  modalBottomSheet,
  menu,
}

class CustomDropdownButton<T> extends StatelessWidget {
  const CustomDropdownButton({
    required this.name,
    this.items,
    this.enabled = true,
    super.key,
    this.asyncItems,
    this.onChanged,
    this.itemAsString = _defaultItemAsString,
    this.selectedItem,
    this.dropdownBuilder,
    this.hintText,
    this.showSearchBox = false,
    this.showSelectedItems = false,
    this.type = CustomDropdownType.menu,
    this.showClearButton = false,
    this.showDropdownButton = true,
    this.validator,
    this.searchHintText,
    this.labelText,
    this.popupConstraints,
  });
  final String name;
  final String? Function(T? item)? validator;
  final List<T>? items;
  final bool enabled;
  final Future<List<T>> Function(String text)? asyncItems;
  final void Function(T? item)? onChanged;
  final String Function(T? item)? itemAsString;
  final T? selectedItem;
  final Widget Function(BuildContext context, T? item)? dropdownBuilder;
  final String? hintText;
  final String? searchHintText;
  final bool showSearchBox;
  final bool showSelectedItems;
  final CustomDropdownType type;
  final String? labelText;
  final BoxConstraints? popupConstraints;
  final bool showClearButton;
  final bool showDropdownButton;

  static String _defaultItemAsString(dynamic item) => item.toString();

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      initialValue: selectedItem,
      onChanged: onChanged,
      validator: validator,
      builder: (field) => DropdownSearch<T>(
        items: items ?? [],
        asyncItems: asyncItems,
        enabled: enabled,
        selectedItem: selectedItem,
        onChanged: (value) {
          field.didChange(value);
          onChanged?.call(value);
        },
        itemAsString: itemAsString,
        compareFn: (item, selectedItem) => item == selectedItem,
        dropdownBuilder: dropdownBuilder,
        filterFn: (item, filter) =>
            itemAsString
                ?.call(item)
                .toLowerCase()
                .contains(filter.toLowerCase()) ??
            false,
        clearButtonProps: _clearButtonProps(),
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            hintText: hintText,
            errorText: field.errorText,
            labelText: labelText,
            contentPadding: EdgeInsets.symmetric(
              vertical:
                  (context.theme.inputDecorationTheme.contentPadding!.vertical /
                          2) +
                      2,
              horizontal: context
                      .theme.inputDecorationTheme.contentPadding!.horizontal /
                  2,
            ),
            prefixIconConstraints: const BoxConstraints(),
          ),
        ),
        dropdownButtonProps: _dropdownButtonProps(),
        popupProps: type == CustomDropdownType.menu
            ? buildPopupMenuType()
            : buildPopupModalType(),
      ),
    );
  }

  ClearButtonProps _clearButtonProps() {
    return ClearButtonProps(
      isVisible: showClearButton,
      iconSize: 18,
      color: Colors.grey.shade500,
      icon: const Icon(Icons.clear),
    );
  }

  DropdownButtonProps _dropdownButtonProps() {
    return DropdownButtonProps(
      isVisible: showDropdownButton,
      color: Colors.grey.shade500,
      iconSize: 18,
      icon: const Icon(Icons.expand_more_rounded),
    );
  }

  PopupProps<T> buildPopupMenuType() {
    return PopupProps.menu(
      fit: FlexFit.loose,
      showSearchBox: showSearchBox,
      showSelectedItems: showSelectedItems,
      itemBuilder: _buildItemBuilder,
      emptyBuilder: _buildEmptyBuilder,
      searchFieldProps: _buildSearchFieldProps(),
      searchDelay: Duration.zero,
      containerBuilder: (context, popupWidget) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: popupWidget,
      ).marginOnly(bottom: 30),
      menuProps: MenuProps(
        positionCallback: _buildPopupMenuPositionCallback,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.grey.withOpacity(.6),
        elevation: 0,
      ),
    );
  }

  RelativeRect _buildPopupMenuPositionCallback(
    RenderBox popupButtonObject,
    RenderBox overlay,
  ) {
    return RelativeRect.fromSize(
      Rect.fromPoints(
        popupButtonObject.localToGlobal(
          popupButtonObject.size.bottomLeft(Offset.zero) + const Offset(0, 4),
          ancestor: overlay,
        ),
        popupButtonObject.localToGlobal(
          popupButtonObject.size.bottomRight(Offset.zero) + const Offset(0, 4),
          ancestor: overlay,
        ),
      ),
      Size(overlay.size.width, overlay.size.height),
    );
  }

  PopupProps<T> buildPopupModalType() {
    return PopupProps.modalBottomSheet(
      fit: FlexFit.loose,
      constraints: popupConstraints ?? const BoxConstraints(maxHeight: 350),
      showSearchBox: showSearchBox,
      showSelectedItems: showSelectedItems,
      containerBuilder: _buildContainerBuilder,
      itemBuilder: _buildItemBuilder,
      emptyBuilder: _buildEmptyBuilder,
      searchDelay: Duration.zero,
      searchFieldProps: _buildSearchFieldProps(),
      modalBottomSheetProps: ModalBottomSheetProps(
        backgroundColor: Colors.white,
        barrierColor: Colors.grey.withOpacity(.6),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  TextFieldProps _buildSearchFieldProps() {
    return TextFieldProps(
      decoration: InputDecoration(
        hintText:
            searchHintText ?? '${items?.length ?? 0} seçenek arasında ara',
      ),
    );
  }

  Widget _buildEmptyBuilder(context, searchEntry) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sonuç bulunamadı',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      );

  Widget _buildItemBuilder(BuildContext context, T item, bool isSelected) =>
      Column(
        children: [
          ListTile(
            dense: true,
            visualDensity: VisualDensity.compact,
            title: Text(
              itemAsString?.call(item) ?? '',
              style: TextStyle(
                color: showSelectedItems && isSelected
                    ? context.theme.primaryColor
                    : context.theme.textTheme.bodyLarge?.color,
              ),
            ),
          ),
          // last item
          if (items?.last != item)
            const Divider(endIndent: 12, indent: 12, height: 4),
        ],
      );

  Widget _buildContainerBuilder(BuildContext context, Widget popupWidget) =>
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        constraints: BoxConstraints(
          maxHeight: context.height * .6,
        ),
        child: popupWidget,
      );
}
