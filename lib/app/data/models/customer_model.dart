class Customerss {
  int? customerID;
  String? customerCode;
  String? name;
  String? address;
  String? mobile;
  int? type;
  int? createdBy;
  String? createdDate;
  int? modifyBy;
  String? modifyDate;
  Customerss(
      {this.modifyDate,
      this.modifyBy,
      this.createdDate,
      this.createdBy,
      this.address,
      this.customerCode,
      this.customerID,
      this.mobile,
      this.name,
      this.type});

  Customerss.fromJson(Map<String, dynamic> json) {
    customerID = json['CustomerID'];
    customerCode = json['CustomerCode'];
    name = json['Name'];
    address = json['Address'];
    mobile = json['Mobile'];
    type = json['Type'];
    createdBy = json['CreatedBy'];
    createdDate = json['CreatedDate'];
    modifyBy = json['ModifyBy'];
    modifyDate = json['ModifyDate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['CustomerID'] = this.customerID;
    data['Name'] = this.name;
    data['Addres'] = this.address;
    data['Moblie'] = this.mobile;
    data['Type'] = this.type;
    data['CreatedBy'] = this.createdBy;
    data['CreatedDate'] = this.createdDate;
    data['ModifyBy'] = this.modifyBy;
    data['ModifyDate'] = this.modifyDate;
    return data;
  }
}
