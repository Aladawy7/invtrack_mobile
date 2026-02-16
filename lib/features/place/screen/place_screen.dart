import 'package:flutter/material.dart';
import 'package:invtrack/features/place/models/asset_model.dart';
import 'package:invtrack/features/place/widgets/asset_detail_sheet.dart';
import 'package:invtrack/features/place/data/sample_assets.dart';
import 'package:invtrack/features/place/widgets/assets_app_bar.dart';
import 'package:invtrack/features/place/widgets/assets_body.dart';

class PlaceScreen extends StatefulWidget {
  const PlaceScreen({super.key});

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  final List<Asset> _assets = getSampleAssets();

  String _filter = 'الكل';
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final filtered = _assets.where((a) {
      final matchesFilter = _filter == 'الكل' ||
          (_filter == 'سليمة' && a.status == AssetStatus.good) ||
          (_filter == 'تالف' && a.status == AssetStatus.broken);
      final matchesSearch = _search.isEmpty ||
          a.name.contains(_search) ||
          a.code.contains(_search) ||
          a.owner.contains(_search);
      return matchesFilter && matchesSearch;
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AssetsAppBar(
          title: 'غرفة 102',
          subtitle: 'مبنى الخدمات - الطابق الأول',
          progress: 0.5,
          progressText: 'الفحص: 5 من 10',
          onBack: () => Navigator.of(context).maybePop(),
        ),
        body: AssetsBody(
          assets: filtered,
          filter: _filter,
          search: _search,
          onFilterChanged: (v) => setState(() => _filter = v),
          onSearchChanged: (v) => setState(() => _search = v),
          onOpenDetails: (a) => _openDetails(a),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  void _openDetails(Asset asset) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => AssetDetailSheet(asset: asset),
      ),
    );
  }
}