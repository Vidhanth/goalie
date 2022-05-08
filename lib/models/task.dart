class Task {
  Task({
    this.id,
    required this.goalId,
    required this.text,
    this.color = 0,
    this.completed = false,
  });

  int? id;
  final int goalId;
  final int color;
  String text;
  bool completed;

  Task copyWith(
      {int? id, int? goalId, String? text, int? color, bool? completed}) {
    return Task(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      text: text ?? this.text,
      color: color ?? this.color,
      completed: completed ?? this.completed,
    );
  }

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"],
        goalId: json["goal_id"],
        text: json["text"],
        completed: json["completed"] == 1,
        color: json["color"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "goal_id": goalId,
        "text": text,
        "completed": completed ? 1 : 0,
        "color": color,
      };
}
