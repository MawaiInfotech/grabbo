import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'connectivity_cubit.dart';

class NoInternetWrapper extends StatelessWidget {
  final Widget child;

  const NoInternetWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        BlocBuilder<ConnectivityCubit, InternetStatus>(
          builder: (context, state) {
            if (state == InternetStatus.disconnected) {
              return const _NoInternetView();
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}

class _NoInternetView extends StatelessWidget {
  const _NoInternetView();

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFFF3E0),
              Color(0xffFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🛒 Grocery style icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.shade100,
                ),
                child: const Icon(
                  Icons.wifi_off_rounded,
                  size: 64,
                  color: Colors.deepOrange,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "You're Offline",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Please check your internet connection\nand try again.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 28),

              // 🔁 Retry Button
              ElevatedButton.icon(
                onPressed: () {
                  context.read<ConnectivityCubit>().emit(
                    InternetStatus.connected,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text(
                  "Retry",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
