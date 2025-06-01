import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet {
  static Future<void> show(
    BuildContext context, {
    required Widget body,
    double? highPercent,
    Color? color,
  }) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: color ?? Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      useRootNavigator: true,
      useSafeArea: true,
      barrierColor: Colors.grey.withOpacity(.7),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Wrap(
          children: [
            Container(
              height: highPercent == null ? null : context.height * highPercent,
              width: context.width,
              color: color,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 6,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(vertical: 12),
                  const SizedBox(height: 12),
                  body,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
