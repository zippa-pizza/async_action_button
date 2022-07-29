import 'package:async_action_button/src/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_bloc/flutter_bloc.dart';

class AsyncActionButton extends StatelessWidget {
  /// An icon to show before [text].
  final Widget? icon;

  final String? text;

  /// A tooltip to show when long-pressing the button.
  ///
  /// Consider using this when only [icon] is non-null.
  final String? tooltip;

  final Color? foregroundColor;
  final Color? backgroundColor;

  /// Whether the button should extend to fill the entire horizontal axis
  /// space available.
  final bool shouldFillHorizontalAxis;

  /// This must return a [Future] so that the loading indicator can be
  /// displayed.
  final Future<void> Function()? onPressed;

  /// Override the loading state
  final bool? isLoadingOverride;

  /// A button that when tapped shows a loading indicator until the future
  /// returned from [onPressed] is completed.
  ///
  /// One of [icon] or [text] must be non-null.
  const AsyncActionButton({
    super.key,
    this.icon,
    this.text,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.shouldFillHorizontalAxis = true,
    required this.onPressed,
    this.isLoadingOverride,
  }) : assert(icon != null || text != null);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AsyncActionButtonBloc>(
      create: (_) => AsyncActionButtonBloc(),
      child: BlocBuilder<AsyncActionButtonBloc, bool>(
        builder: (context, isLoadingFromState) {
          final bool isLoading = isLoadingOverride ?? isLoadingFromState;

          final bool shouldBeDisabled = isLoading || onPressed == null;

          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: shouldFillHorizontalAxis ? double.infinity : null,
                child: Opacity(
                  opacity: isLoading ? 0.2 : 1,
                  child: adaptive.Button(
                    icon: icon,
                    text: text,
                    tooltip: tooltip,
                    onPressed: shouldBeDisabled
                        ? null
                        : () => context
                            .read<AsyncActionButtonBloc>()
                            .submit(onPressed!),
                    foregroundColor: foregroundColor,
                    backgroundColor: backgroundColor,
                  ),
                ),
              ),
              if (isLoading) const adaptive.Spinner(size: 20),
            ],
          );
        },
      ),
    );
  }
}
