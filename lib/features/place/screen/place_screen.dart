import 'package:flutter/material.dart';
import 'package:invtrack/core/utils/colors.dart';
import 'package:invtrack/features/place/models/asset_model.dart';
import 'package:invtrack/features/place/widgets/asset_detail_sheet.dart';
import 'package:invtrack/features/place/data/sample_assets.dart';
import 'package:invtrack/features/place/widgets/assets_app_bar.dart';
import 'package:invtrack/features/place/widgets/assets_body.dart';
import 'package:invtrack/features/place/widgets/filter_bar.dart';
import 'package:invtrack/features/place/widgets/assets_progress.dart';

class PlaceScreen extends StatefulWidget {
  final String? location;
  final String? floor;
  final String? room;

  const PlaceScreen({super.key, this.location, this.floor, this.room});

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
      final matchesFilter =
          _filter == 'الكل' ||
          (_filter == 'سليمة' && a.status == AssetStatus.good) ||
          (_filter == 'تالف' && a.status == AssetStatus.broken);
      final matchesSearch =
          _search.isEmpty ||
          a.name.contains(_search) ||
          a.code.contains(_search) ||
          a.owner.contains(_search);
      return matchesFilter && matchesSearch;
    }).toList();

    final title = widget.room ?? 'غرفة غير محددة';
    final subtitle = '${widget.location ?? '???'} - ${widget.floor ?? '???'}';
    final total = _assets.length;
    final completedCount = _assets.where((a) => a.isCompleted).length;
    final progress = total == 0 ? 0.0 : completedCount / total;
    final progressText = '$completedCount / $total';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AssetsAppBar(title: title, subtitle: subtitle),
        body: Column(
          children: [
            // progress row
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: AssetsProgress(
                progress: progress,
                progressText: progressText,
                foregroundColor: Colors.black87,
                progressColor: Colors.green,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: FilterBar(
                filter: _filter,
                onFilterChanged: (v) => setState(() => _filter = v),
                search: _search,
                onSearchChanged: (v) => setState(() => _search = v),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: AssetsBody(
                assets: filtered,
                onOpenDetails: (a) => _openDetails(a),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 9, 71, 122).withOpacity(0.6),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(Icons.camera_alt, size: 32, color: Colors.white),
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
        builder: (_, controller) => AssetDetailSheet(
          asset: asset,
          onSave: (updated) {
            setState(() {
              final idx = _assets.indexWhere((a) => a.code == updated.code);
              if (idx != -1) {
                _assets[idx] = updated;
              }
            });
          },
        ),
      ),
    );
  }
}
