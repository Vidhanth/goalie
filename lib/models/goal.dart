import 'package:goalie/utils/date_helper.dart';

class Goal {
  Goal({
    this.id,
    required this.text,
    required this.color,
    this.createdAt,
  }) {
    createdAt ??= DateHelper.getDatabaseDate(DateTime.now());
  }

  int? id;
  String text;
  int color;
  String? createdAt;

  Goal copyWith({int? id, String? text, int? color, String? createdAt}) {
    return Goal(
      id: id ?? this.id,
      text: text ?? this.text,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }

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
