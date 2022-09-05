class Categorys {
  int? categoryID;
  String? category;
  int? createdBy;
  String? createdDate;
  int? modifyBy;
  String? modifyDate;

  Categorys(
      {this.categoryID,
      this.category,
      this.createdBy,
      this.createdDate,
      this.modifyBy,
      this.modifyDate});

  Categorys.fromJson(Map<String, dynamic> json) {
    categoryID = json['CategoryID'];
    category = json['Category'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    modifyBy = json['ModifyBy'];
    modifyDate = json['ModifyDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['CategoryID'] = categoryID;
    data['Category'] = category;
    data['CreatedBy'] = createdBy;
    data['CreatedDate'] = createdDate;
    data['ModifyBy'] = modifyBy;
    data['ModifyDate'] = modifyDate;
    return data;
  }
}
