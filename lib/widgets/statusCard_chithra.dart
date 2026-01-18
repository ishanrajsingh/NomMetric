import 'package:flutter/material.dart';

class StatusCardChithra extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final Color? statusColor;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const StatusCardChithra({
    Key? key,
    required this.icon,
    required this.title,
    required this.message,
    this.statusColor,
    this.actionText,
    this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor =
        statusColor ?? Theme.of(context).colorScheme.primary;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: double.infinity,
            decoration: BoxDecoration(
              color: effectiveColor,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: effectiveColor.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: 22,
                      color: effectiveColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          message,
                          style:
                              Theme.of(context).textTheme.bodyMedium,
                        ),

                        if (actionText != null &&
                            onActionPressed != null) ...[
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: onActionPressed,
                            style: TextButton.styleFrom(
                              foregroundColor: effectiveColor,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(actionText!),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
