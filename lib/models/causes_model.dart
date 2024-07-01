class CausesModel {
  final int id;
  final String description;

  CausesModel(
    this.id,
    this.description,
  );

  factory CausesModel.fromJson(Map<String, dynamic> json) {
    return CausesModel(
      json['id'],
      json['description'],
    );
  }
}
