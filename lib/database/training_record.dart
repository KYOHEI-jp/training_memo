class TrainingRecord {
  final int? id;
  final String part;
  final String exercise;
  final int weight;
  final int reps;

  TrainingRecord({this.id, required this.part, required this.exercise, required this.weight, required this.reps});

  // TrainingRecord オブジェクトをマップに変換するメソッド
  Map<String, dynamic> toMap() {
    return {
      'id': id,         // idは自動生成されるので、nullでも大丈夫です
      'part': part,
      'exercise': exercise,
      'weight': weight,
      'reps': reps,
    };
  }
}
