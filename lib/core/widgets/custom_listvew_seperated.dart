import 'package:flutter/material.dart';

class CustomListViewSeparated<T> extends StatelessWidget {
  const CustomListViewSeparated({
    required this.data,
    required this.itemBuilder,
    super.key,
    this.physics,
    this.shrinkWrap,
    this.separatorBuilder,
    this.padding = EdgeInsets.zero,
  });

  final List<T>? data;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;
  final Widget Function(BuildContext context, T item,int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      separatorBuilder: separatorBuilder ?? (context, index) => const Divider(),
      shrinkWrap: shrinkWrap ?? true,
      physics: physics ?? const ClampingScrollPhysics(),
      itemCount: data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) =>
          itemBuilder(context, data![index],index),
    );
  }
}
