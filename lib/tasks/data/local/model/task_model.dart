class TaskModel {
  String id;
  String title;
  String detail;
  String description;
  DateTime? startDateTime;
  DateTime? stopDateTime;
  bool completed;

  TaskModel({
    required this.id,
    required this.title,
    required this.detail,
    required this.description,
    required this.startDateTime,
    required this.stopDateTime,
    this.completed = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'description': description,
      'completed': completed,
      'startDateTime': startDateTime?.toIso8601String(),
      'stopDateTime': stopDateTime?.toIso8601String(),
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      detail: json['detail'],
      description: json['description'],
      completed: json['completed'],
      startDateTime: DateTime.parse(json['startDateTime']),
      stopDateTime: DateTime.parse(json['stopDateTime']),
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, detail: $detail, title: $title, description: $description, '
        'startDateTime: $startDateTime, stopDateTime: $stopDateTime, '
        'completed: $completed}';
  }
}
