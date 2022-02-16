class Goal {
  Goal({
    this.id,
    required this.text,
    required this.color,
    this.createdAt,
  });

  int? id;
  String text;
  int color;
  String? createdAt;

  factory Goal.fromMap(Map<String, dynamic> json) => Goal(
        id: json["id"],
        text: json["text"],
        color: json["color"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "text": text,
        "color": color,
        "created_at": createdAt,
      };
}
