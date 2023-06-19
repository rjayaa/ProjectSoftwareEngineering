class Sellers {
  String? sellersUID;
  String? sellerName;
  String? phone;
  String? sellerAvatarUrl;

  Sellers({
    this.sellersUID,
    this.sellerName,
    this.phone,
    this.sellerAvatarUrl,
  });
  Sellers.fromJson(Map<String, dynamic> json) {
    sellersUID = json["sellersUID"];
    sellerName = json["sellerName"];
    phone = json["phone"];
    sellerAvatarUrl = json["sellerAvatarUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["sellersUID"] = this.sellersUID;
    data["sellerName"] = this.sellerName;
    data["phone"] = this.phone;
    data["sellerAvatarUrl"] = this.sellerAvatarUrl;

    return data;
  }
}
