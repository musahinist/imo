class Task {
  Task({
    this.id,
    this.title,
    this.description,
    this.status,
    this.priority,
    this.assignee,
    this.creator,
    this.dueDate,
    this.category,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? title;
  String? description;
  String? status;
  String? priority;
  String? assignee;
  String? creator;
  String? dueDate;
  String? category;
  String? userId;
  String? createdAt;
  String? updatedAt;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        status: json['status'] as String?,
        priority: json['priority'] as String?,
        assignee: json['assignee'] as String?,
        creator: json['creator'] as String?,
        dueDate: json['dueDate'] as String?,
        category: json['category'] as String?,
        userId: json['user_id'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'status': status,
        'priority': priority,
        'assignee': assignee,
        'creator': creator,
        'dueDate': dueDate,
        'category': category,
        'user_id': userId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  Task copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
    String? priority,
    String? assignee,
    String? creator,
    String? dueDate,
    String? category,
    String? userId,
    String? createdAt,
    String? updatedAt,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      assignee: assignee ?? this.assignee,
      creator: creator ?? this.creator,
      dueDate: dueDate ?? this.dueDate,
      category: category ?? this.category,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
