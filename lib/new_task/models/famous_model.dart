class FamousModel {
  final String? id;
  final String? name;
  final String? address;
  final String? image;

  FamousModel({this.address, this.id, this.image, this.name});

  factory FamousModel.fromjson(json) {
    return FamousModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        address: json['address']);
  }
}
