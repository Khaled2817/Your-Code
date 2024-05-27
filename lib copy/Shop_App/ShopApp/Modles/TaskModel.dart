class TaskModel {
  List<DataTask>? data;
  dynamic? message;
  dynamic? code;

  TaskModel({this.data, this.message, this.code});

  TaskModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataTask>[];
      json['data'].forEach((v) {
        data!.add(new DataTask.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class DataTask {
  dynamic? id;
  dynamic? restaurantId;
  String? user;
  dynamic? status;
  dynamic? lat;
  dynamic? lng;
  dynamic? deletedAt;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? distance;
  dynamic? rate;
  String? address;
  String? name;
  String? image;
  bool? rated;
  Restaurant? restaurant;

  DataTask(
      {this.id,
      this.restaurantId,
      this.user,
      this.status,
      this.lat,
      this.lng,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.distance,
      this.rate,
      this.address,
      this.name,
      this.image,
      this.rated,
      this.restaurant});

  DataTask.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    restaurantId = json['restaurant_id'];
    user = json['user'];
    status = json['status'];
    lat = json['lat'];
    lng = json['lng'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    distance = json['distance'];
    rate = json['rate'];
    address = json['address'];
    name = json['name'];
    image = json['image'];
    rated = json['rated'];
    restaurant = json['restaurant'] != null
        ? new Restaurant.fromJson(json['restaurant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['restaurant_id'] = this.restaurantId;
    data['user'] = this.user;
    data['status'] = this.status;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['distance'] = this.distance;
    data['rate'] = this.rate;
    data['address'] = this.address;
    data['name'] = this.name;
    data['image'] = this.image;
    data['rated'] = this.rated;
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.toJson();
    }
    return data;
  }
}

class Restaurant {
  dynamic? id;
  dynamic? image;
  dynamic? name;

  Restaurant({this.id, this.image, this.name});

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}