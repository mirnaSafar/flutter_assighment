class ItemDetailsModel {
  int? id;
  String? imageUrl;
  String? type;
  List<dynamic>? related;

  ItemDetailsModel({this.id, this.imageUrl, this.type, this.related});

  ItemDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    imageUrl = json["imageUrl"];
    type = json["type"];
    related = json["related"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["imageUrl"] = imageUrl;
    data["type"] = type;
    if (related != null) {
      data["related"] = related?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
