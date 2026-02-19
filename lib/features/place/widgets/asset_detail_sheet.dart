import 'package:flutter/material.dart';
import '../models/asset_model.dart';

class AssetDetailSheet extends StatefulWidget {
  final Asset asset;

  const AssetDetailSheet({Key? key, required this.asset}) : super(key: key);

  @override
  State<AssetDetailSheet> createState() => _AssetDetailSheetState();
}

class _AssetDetailSheetState extends State<AssetDetailSheet> {
  AssetStatus? _status;
  // ignore: unused_field
  String _notes = '';

  @override
  void initState() {
    super.initState();
    _status = widget.asset.status;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('تفاصيل العهدة',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge),
          const SizedBox(height: 12),

          // Asset info
          _infoRow('الاسم', widget.asset.name),
          _infoRow('الرمز', widget.asset.code),
          _infoRow('المسؤول', widget.asset.owner),
          _infoRow('المواصفات', widget.asset.specs),
          const SizedBox(height: 12),

          // Image picker placeholder
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.image, size: 40, color: Colors.grey),
                    SizedBox(height: 6),
                    Text('اضغط لرفع صورة', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Status selector
          Row(
            children: [
              Expanded(
                child: _statusButton(AssetStatus.good, 'سليمة'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _statusButton(AssetStatus.broken, 'تالفة'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _statusButton(AssetStatus.notChecked, 'مفقودة'),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Notes
          TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'ملاحظات',
              fillColor: Colors.grey.shade100,
              filled: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onChanged: (v) => setState(() => _notes = v),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('إلغاء'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Placeholder: Save action
                    Navigator.of(context).pop();
                  },
                  child: const Text('حفظ'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _statusButton(AssetStatus s, String label) {
    final selected = _status == s;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: selected ? 2 : 0,
        backgroundColor: selected ? Colors.blue : Colors.grey.shade100,
        foregroundColor: selected ? Colors.white : Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => setState(() => _status = s),
      child: Text(label),
    );
  }
}
