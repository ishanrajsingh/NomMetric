import 'package:flutter/material.dart';

class StatusCardJuber extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String statusType;
  final String? actionButtonText;
  final VoidCallback? onActionPressed;
  final bool showDismiss;
  final VoidCallback? onDismissPressed;

  const StatusCardJuber({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.statusType = 'info',
    this.actionButtonText,
    this.onActionPressed,
    this.showDismiss = false,
    this.onDismissPressed,
  }) : super(key: key);

  Color _getStatusColor() {
    switch (statusType.toLowerCase()) {
      case 'success':
        return Colors.green;
      case 'warning':
        return Colors.orange;
      case 'error':
        return Colors.red;
      case 'info':
      default:
        return Colors.blue;
    }
  }

  Color _getBackgroundColor() {
    switch (statusType.toLowerCase()) {
      case 'success':
        return Colors.green.shade50;
      case 'warning':
        return Colors.orange.shade50;
      case 'error':
        return Colors.red.shade50;
      case 'info':
      default:
        return Colors.blue.shade50;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();
    final backgroundColor = _getBackgroundColor();

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: statusColor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      color: backgroundColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: statusColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: statusColor.withOpacity(0.9),
                    ),
                  ),
                ),
                if (showDismiss)
                  GestureDetector(
                    onTap: onDismissPressed,
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.grey.shade600,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 44),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800,
                  height: 1.4,
                ),
              ),
            ),
            if (actionButtonText != null && onActionPressed != null) ...[
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 44),
                child: ElevatedButton(
                  onPressed: onActionPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: statusColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    actionButtonText!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}