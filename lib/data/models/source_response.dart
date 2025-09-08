import 'package:news_app/data/models/source_d_m.dart';

class SourceResponse {
  String? status;
  String? code;
  String? message;
  List<SourceDM>? sources;

  SourceResponse({
    this.status,
    this.code,
    this.message,
    this.sources,
  });

  factory SourceResponse.fromJson(dynamic json) {
    List<SourceDM> sourcesList = [];
    if (json['sources'] != null) {
      for (var source in json['sources']) {
        sourcesList.add(SourceDM.fromJson(source));
      }
    }

    return SourceResponse(
      status: json['status'] ?? '',
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      sources: sourcesList,
    );
  }
}
