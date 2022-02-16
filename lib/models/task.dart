class Task {
  Task({
    this.id,
    required this.goalId,
    required this.text,
    required this.completed,
  });

  int? id;
  final int goalId;
  String text;
  bool completed;

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"],
        goalId: json["goal_id"],
        text: json["text"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "goal_id": goalId,
        "text": text,
        "completed": completed,
      };
}
