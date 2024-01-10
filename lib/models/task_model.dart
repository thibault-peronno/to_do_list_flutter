class TaskModel {
  int id;
  String description;
  bool isDone;

  TaskModel({
    required this.id,
    required this.description,
    required this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      description: json['description'],
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'isDone': isDone,
      };
}
