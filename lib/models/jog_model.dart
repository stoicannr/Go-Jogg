
final String tableJogs = 'jogs';

class JogFields {

  static final List<String> values = [
    id,title,description,time
  ];


  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}


class Jog {
  final int? id;
  final String title;
  final String description;
  final DateTime createdTime;

  const Jog({
    this.id,
    required this.title,
    required this.createdTime,
    required this.description
});

  Jog copy({
    int? id,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Jog(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Jog fromJson(Map<String, Object?> json) => Jog(
    id: json[JogFields.id] as int?,
    title: json[JogFields.title] as String,
    description: json[JogFields.description] as String,
    createdTime: DateTime.parse(json[JogFields.time] as String),
  );
  Map<String, Object?> toJson() => {
    JogFields.id: id,
    JogFields.title: title,
    JogFields.description: description,
    JogFields.time: createdTime.toIso8601String(),
  };

}