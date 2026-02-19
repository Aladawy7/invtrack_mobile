import 'package:flutter/material.dart';
import '../models/asset_model.dart';

class AssetCard extends StatelessWidget {
  final Asset asset;
  final VoidCallback? onTap;

  const AssetCard({Key? key, required this.asset, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _borderColorForAsset(asset),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    asset.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    asset.code,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'المسـلّم: ${asset.owner}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600], fontSize: 11),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _borderColorForAsset(asset),
                        foregroundColor: _textColorForAsset(_borderColorForAsset(asset)),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(_labelForAsset(asset), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: asset.completed
                  ? CircleAvatar(
                      radius: 18,
                      backgroundColor: _borderColorForAsset(asset),
                      child: const Icon(Icons.check, color: Colors.white, size: 18),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Color _borderColorForAsset(Asset asset) {
    switch (asset.status) {
      case AssetStatus.good:
        return Colors.green;
      case AssetStatus.broken:
        return Colors.orange;
      case AssetStatus.notChecked:
        return Colors.grey;
    }
  }

  Color _textColorForAsset(Color bg) {
    // choose white for dark backgrounds, black for light
    return bg.computeLuminance() < 0.5 ? Colors.white : Colors.black87;
  }

  String _labelForAsset(Asset asset) {
    switch (asset.status) {
      case AssetStatus.good:
        return 'سليمة';
      case AssetStatus.broken:
        return 'تالف';
      case AssetStatus.notChecked:
        return 'لم يجرد';
    }
  }
}

class StatusBadge extends StatelessWidget {
  final AssetStatus status;

  const StatusBadge({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bg;
    String text;
    switch (status) {
      case AssetStatus.good:
        bg = Colors.green.shade100;
        text = 'جيد';
        break;
      case AssetStatus.notChecked:
        bg = Colors.orange.shade100;
        text = 'لم يجرد';
        break;
      case AssetStatus.broken:
        bg = Colors.red.shade100;
        text = 'تالف';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
