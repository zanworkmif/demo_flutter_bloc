import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TodoModel {
  final int id;
  final int userId;
  final String title;
  bool isComplete;

  TodoModel({
    required this.id,
    required this.userId,
    required this.title,
    this.isComplete = false,
  });

  copyWith({int? id, int? userId, String? title, bool? isComplete}) {
    return TodoModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        isComplete: isComplete ?? this.isComplete);
  }

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

TodoModel _$TaskFromJson(Map<String, dynamic> json) => TodoModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['todo'] as String,
      isComplete: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskToJson(TodoModel instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'completed': instance.isComplete,
    };
