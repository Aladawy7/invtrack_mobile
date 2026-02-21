import 'package:flutter/material.dart';

class AssetsProgress extends StatelessWidget {
  final double progress;
  final String progressText;
  final Color? foregroundColor;
  final Color? progressColor;

  const AssetsProgress({
    Key? key,
    required this.progress,
    required this.progressText,
    this.foregroundColor,
    this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fg = foregroundColor ?? Colors.white;
    final pc = progressColor ?? Colors.greenAccent.shade400;
    return Row(
      children: [
        Text('${(progress * 100).round()}%', style: TextStyle(color: fg)),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: fg.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(pc),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(progressText, style: TextStyle(color: fg)),
      ],
    );
  }
}
