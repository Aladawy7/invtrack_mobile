import '../models/asset_model.dart';

List<Asset> getSampleAssets() {
  return List.generate(
    10,
    (i) => Asset(
      name: 'حاسوب مكتب ${i + 1}',
      code: 'IT-2024-${(i + 1).toString().padLeft(3, '0')}',
      owner: 'أحمد محمد',
      specs: 'Intel i5 - 8GB RAM - 256GB SSD',
      status: i % 3 == 0
          ? AssetStatus.good
          : (i % 3 == 1 ? AssetStatus.warning : AssetStatus.broken),
      completed: i % 2 == 0,
    ),
  );
}
