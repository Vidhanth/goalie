class Goal {
  Goal({
    this.id,
    required this.text,
    required this.color,
    this.createdAt,
    this.customOrder,
    this.totalTasks,
    this.completedTasks,
  }) {
    createdAt ??= DateTime.now().toString();
  }

  int? id;
  String text;
  int color;
  String? createdAt;
  List<int>? customOrder;
  int? totalTasks;
  int? completedTasks;

  Goal copyWith({
    int? id,
    String? text,
    int? color,
    String? createdAt,
    List<int>? customOrder,
    int? totalTasks,
    int? completedTasks,
  }) {
    return Goal(
      id: id ?? this.id,
      text: text ?? this.text,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
      customOrder: customOrder ?? this.customOrder,
      totalTasks: totalTasks ?? this.totalTasks,
      completedTasks: completedTasks ?? this.completedTasks,
    );
  }

  factory Goal.fromMap(Map<String, dynamic> json) => Goal(
        id: json["id"],
        text: json["text"],
        color: json["color"],
        createdAt: json["created_at"],
        customOrder: _listFromString(json["custom_order"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "text": text,
        "color": color,
        "created_at": createdAt,
        "custom_order": _stringFromList(customOrder ?? []),
      };

  static String _stringFromList(List<int> list) {
    return list.toString().substring(1, list.toString().length - 1);
  }

  static List<int> _listFromString(String string) {
    if (string.isEmpty) return [];
    return string.split(',').map((id) {
      return int.parse(id);
    }).toList();
  }
}
