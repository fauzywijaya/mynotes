class HomeListResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<HomeItemResponse>? homesData;
  HomeListResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.homesData,
  });

  HomeListResponse.fromJson(Map<String, dynamic> json) {
    page = json["page"];
    perPage = json["per_page"];
    total = json["total"];
    totalPages = json["total_pages"];
    if (json['data'] != null) {
      homesData = <HomeItemResponse>[];
      json['data'].forEach((v) {
        homesData!.add(HomeItemResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["page"] = page;
    data["per_page"] = perPage;
    data["total"] = total;
    data["total_pages"] = totalPages;
    if (homesData != null) {
      data['data'] = homesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeItemResponse {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  HomeItemResponse({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  HomeItemResponse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["email"] = email;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["avatar"] = avatar;
    return data;
  }
}
