import 'package:news_app/domain/entities/source_entity.dart';

class SourceDM {
  String? id;
  String? name;

  SourceDM({
    this.id,
    this.name,
  });

  factory SourceDM.fromJson(dynamic json) {
    return SourceDM(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  factory SourceDM.fromEntity(SourceEntity entity) {
    return SourceDM(
      id: entity.id,
      name: entity.name,
    );
  }

  SourceEntity toEntity() {
    return SourceEntity(
      id: id,
      name: name,
    );
  }
}
