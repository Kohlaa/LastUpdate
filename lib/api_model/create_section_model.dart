class CreateSectionModel {
  final String msg;
  final SectionModel section;
  final bool status;

  CreateSectionModel({
    required this.msg,
    required this.section,
    required this.status,
  });

  factory CreateSectionModel.fromJson(Map<String, dynamic> json) {
    return CreateSectionModel(
      msg: json['msg'],
      section: SectionModel.fromJson(json['Section']),
      status: json['status'],
    );
  }
}

class SectionModel {
  final String sectionChar;
  final int capacity;
  final String parkingId;
  final String id;
  final String createdAt;
  final String updatedAt;
  final int v;

  SectionModel({
    required this.sectionChar,
    required this.capacity,
    required this.parkingId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      sectionChar: json['sectionChar'],
      capacity: json['capacity'],
      parkingId: json['parkingId'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
