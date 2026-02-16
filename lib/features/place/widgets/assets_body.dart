import 'package:flutter/material.dart';
import '../models/asset_model.dart';
import 'asset_card.dart';
import 'filter_bar.dart';

class AssetsBody extends StatelessWidget {
  final List<Asset> assets; // already filtered by parent
  final String filter;
  final String search;
  final ValueChanged<String> onFilterChanged;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<Asset> onOpenDetails;

  const AssetsBody({
    Key? key,
    required this.assets,
    required this.filter,
    required this.search,
    required this.onFilterChanged,
    required this.onSearchChanged,
    required this.onOpenDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            FilterBar(
              filter: filter,
              onFilterChanged: onFilterChanged,
              search: search,
              onSearchChanged: onSearchChanged,
            ),
            const SizedBox(height: 8),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
