import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';

class NoInternetView extends StatefulWidget {
  const NoInternetView({super.key, required this.onRefresh});

  final Future<void> Function() onRefresh;

  @override
  State<NoInternetView> createState() => _NoInternetViewState();
}

class _NoInternetViewState extends State<NoInternetView>
    with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0, end: 14).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);

    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      color: colorScheme.primary,
      backgroundColor: colorScheme.surface,
      strokeWidth: 3,
      displacement: 60,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated wifi-off icon with a pulsing glow
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.6, end: 1.0),
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.easeInOut,
                      builder: (context, opacity, child) {
                        return AnimatedOpacity(
                          opacity: opacity,
                          duration: const Duration(milliseconds: 800),
                          child: child,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorScheme.errorContainer.withValues(
                            alpha: 0.15,
                          ),
                        ),
                        child: Icon(
                          Icons.wifi_off_rounded,
                          size: 80,
                          color: colorScheme.error.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                    verticalSpace(24),
                    Text(
                      'No Internet Connection',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    verticalSpace(8),
                    Text(
                      'Please check your connection and try again',
                      style: TextStyle(
                        fontSize: 14,
                        color: colorScheme.onSurface.withValues(alpha: 0.55),
                      ),
                    ),
                    verticalSpace(40),
                    // Bouncing refresh arrow hint
                    AnimationBuilderWidget(
                      bounceAnimation: _bounceAnimation,
                      colorScheme: colorScheme,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimationBuilderWidget extends StatelessWidget {
  const AnimationBuilderWidget({
    super.key,
    required Animation<double> bounceAnimation,
    required this.colorScheme,
  }) : _bounceAnimation = bounceAnimation;

  final Animation<double> _bounceAnimation;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _bounceAnimation.value),
          child: child,
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.3),
                width: 2,
              ),
              color: colorScheme.primary.withValues(alpha: 0.08),
            ),
            child: Icon(
              Icons.refresh_rounded,
              size: 28,
              color: colorScheme.primary,
            ),
          ),
          verticalSpace(10),
          Text(
            'Swipe down to refresh',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: colorScheme.primary.withValues(alpha: 0.7),
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
