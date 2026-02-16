enum AssetStatus { good, warning, broken }

class Asset {
  final String name;
  final String code;
  final String owner;
  final String specs;
  final AssetStatus status;
  final bool completed;

  Asset({
    required this.name,
    required this.code,
    required this.owner,
    required this.specs,
    this.status = AssetStatus.good,
    this.completed = false,
  });
}
