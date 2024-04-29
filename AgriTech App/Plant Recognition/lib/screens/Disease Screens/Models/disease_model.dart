import 'dart:convert';

class Disease {
  final String image;
  final String name;
  final String cause;
  final String solution;

  Disease(
      {required this.image,
      required this.name,
      required this.cause,
      required this.solution});

  factory Disease.fromJson(Map<String, dynamic> json) {
    return Disease(
      image: json['image'],
      name: json['name'],
      cause: json['cause'],
      solution: json['solution'],
    );
  }
}

List<Disease> parseDiseases(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Disease>((json) => Disease.fromJson(json)).toList();
}
