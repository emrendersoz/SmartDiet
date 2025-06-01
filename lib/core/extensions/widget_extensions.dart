import 'package:flutter/material.dart';

class _WidgetExtensions {
  final Widget _widget;
  _WidgetExtensions(this._widget);

  Center get center => Center(child: _widget);
  Expanded get expanded => Expanded(child: _widget);
  SizedBox get infinityWidth =>
      SizedBox(width: double.infinity, child: _widget);
  InkWell inkWell({void Function()? onTap}) => InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: _widget,
      );
}

extension WidgetExtensions on Widget {
  _WidgetExtensions get customExt => _WidgetExtensions(this);
}
