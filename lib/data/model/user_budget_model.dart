class UserWalletModel {
  int? id;
  String? name;
  String? image;
  String? email;
  bool isSelected = false;

  UserWalletModel(
      {this.id, this.name, this.image, this.email,});

  UserWalletModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    isSelected = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['isSelected'] = this.isSelected;
    return data;
  }
}