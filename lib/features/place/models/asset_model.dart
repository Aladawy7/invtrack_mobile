enum AssetStatus { good, broken, notChecked }

class Asset {
  final String name;
  final String code;
  final String owner;
  final String specs;
  final AssetStatus status;
  final String? notes;

  Asset({
    required this.name,
    required this.code,
    required this.owner,
    required this.specs,
    this.status = AssetStatus.good,
    this.notes,
  });

  bool get isCompleted => status != AssetStatus.notChecked;
  
  Asset copyWith({
    String? name,
    String? code,
    String? owner,
    String? specs,
    AssetStatus? status,
    String? notes,
  }) {
    return Asset(
      name: name ?? this.name,
      code: code ?? this.code,
      owner: owner ?? this.owner,
      specs: specs ?? this.specs,
      status: status ?? this.status,
      notes: notes ?? this.notes,
    );
  }
}
