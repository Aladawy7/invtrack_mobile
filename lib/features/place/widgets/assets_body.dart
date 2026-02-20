import 'package:flutter/material.dart';
import '../models/asset_model.dart';
import 'asset_card.dart';

class AssetsBody extends StatelessWidget {
  final List<Asset> assets; // already filtered by parent
  final ValueChanged<Asset> onOpenDetails;

  const AssetsBody({
    Key? key,
    required this.assets,
    required this.onOpenDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListView.separated(
          itemCount: assets.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, idx) {
            final asset = assets[idx];
            return AssetCard(asset: asset, onTap: () => onOpenDetails(asset));
          },
          padding: const EdgeInsets.only(bottom: 80, top: 8),
        ),
      ),
    );
  }
}
