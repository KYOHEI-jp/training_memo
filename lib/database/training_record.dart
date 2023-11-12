class TrainingRecord {
  int? id;       // データベースのID（自動生成されます）
  String part;   // トレーニングの部位
  String? exercise; // トレーニングの種目
  int? weight;    // 使用重量
  int? reps;      // 実施回数

  TrainingRecord({
    this.id,
    required this.part,
    required this.exercise,
    required this.weight,
    required this.reps,
  });

  factory TrainingRecord.fromMap(Map<String, dynamic> map) {
    return TrainingRecord(
      id: map['id'],
      part: map['part'],
      exercise: map['exercise'],
      weight: map['weight'],
      reps: map['reps'],
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
