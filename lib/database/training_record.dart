class TrainingRecord {
  int? id;
  String part;
  String exercise;
  int? weight;
  int? reps;
  DateTime? createdAt;

  TrainingRecord({
    this.id,
    required this.part,
    required this.exercise,
    required this.weight,
    required this.reps,
    this.createdAt,
  });

  // データベースからのマッピングでnullチェックを行う
  factory TrainingRecord.fromMap(Map<String, dynamic> map) {
    return TrainingRecord(
      id: map['id'] as int?,
      part: map['part'] as String? ?? '',
      // nullの場合はデフォルト値を設定
      exercise: map['exercise'] as String? ?? '',
      weight: map['weight'] as int,
      reps: map['reps'] as int,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'part': part,
      'exercise': exercise,
      'weight': weight,
      'reps': reps,
    };
  }
}
