import 'package:flutter/material.dart';

class _StreamExtension<T> {
  _StreamExtension(Stream<T> stream) : _stream = stream;
  final Stream<T> _stream;

  Widget toBuild({
    required Widget Function(T? data) onSuccess,
    Widget? loadingWidget,
    Widget? notFoundWidget,
    Widget? emptyWidget,
    Widget? onError,
    bool isEmptyOnSuccess = false,
    T? data,
  }) =>
      StreamBuilder<T>(
        stream: _stream,
        initialData: data,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          final result = switch (snapshot.connectionState) {
            ConnectionState.waiting => loadingWidget ?? _defaultLoadingWidget,
            ConnectionState.active || ConnectionState.done => snapshot.hasData
                ? snapshot.data is List
                    ? (snapshot.data! as List).isEmpty
                        ? isEmptyOnSuccess
                            ? onSuccess(null)
                            : emptyWidget ?? _defaultEmptyWidget
                        : onSuccess(snapshot.data)
                    : onSuccess(snapshot.data)
                : onError ?? _defaultErrorWidget,
            _ => notFoundWidget ?? _defaultNotFoundWidget,
          };
          return result;
        },
      );

  Widget get _defaultLoadingWidget =>
      const Center(child: CircularProgressIndicator());
  Widget get _defaultNotFoundWidget => const Center(child: Text('Not Found'));
  Widget get _defaultErrorWidget => const Center(child: Text('Error'));
  Widget get _defaultEmptyWidget =>
      const Center(child: Text('Sonuç Bulunamadı'));
}

extension StreamExtension<T> on Stream<T> {
  _StreamExtension<T> get customExt => _StreamExtension(this);
}
