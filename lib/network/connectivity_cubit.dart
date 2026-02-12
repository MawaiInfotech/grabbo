import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum InternetStatus { connected, disconnected }

class ConnectivityCubit extends Cubit<InternetStatus> {
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  ConnectivityCubit() : super(InternetStatus.connected) {
    _init();
  }

  Future<void> _init() async {
    final results = await Connectivity().checkConnectivity();
    _emitStatus(results);

    _subscription =
        Connectivity().onConnectivityChanged.listen(_emitStatus);
  }

  void _emitStatus(List<ConnectivityResult> results) {
    final hasConnection =
    results.any((r) => r != ConnectivityResult.none);

    emit(
      hasConnection
          ? InternetStatus.connected
          : InternetStatus.disconnected,
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
