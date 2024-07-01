class ClinicModel {
  final int id;
  final String name;
  final String city;
  final String address;
  final String phone;
  final String hours;

  ClinicModel(
    this.id,
    this.name,
    this.city,
    this.address,
    this.phone,
    this.hours,
  );

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      json['id'],
      json['name'],
      json['city'],
      json['address'],
      json['phone'],
      json['hours'],
    );
  }
}
