class Profile {
  Driver? driver;
  int? todayIncome;
  int? todayDeposit;
  int? todayOmzet;
  int? orderCount;

  Profile(
      {this.driver,
      this.todayIncome,
      this.todayDeposit,
      this.todayOmzet,
      this.orderCount});

  Profile.fromJson(Map<String, dynamic> json) {
    driver = json['driver'] != null ? Driver?.fromJson(json['driver']) : null;
    todayIncome = json['today_income'];
    todayDeposit = json['today_deposit'];
    todayOmzet = json['today_omzet'];
    orderCount = json['order_count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    data['today_income'] = todayIncome;
    data['today_deposit'] = todayDeposit;
    data['today_omzet'] = todayOmzet;
    data['order_count'] = orderCount;
    return data;
  }
}

class Driver {
  int? id;
  String? name;
  String? phoneNumber;
  int? totalExpenses;
  int? income;
  int? deposit;
  String? createdAt;
  String? updatedAt;

  Driver(
      {this.id,
      this.name,
      this.phoneNumber,
      this.totalExpenses,
      this.income,
      this.deposit,
      this.createdAt,
      this.updatedAt});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    totalExpenses = json['total_expenses'];
    income = json['income'];
    deposit = json['deposit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['total_expenses'] = totalExpenses;
    data['income'] = income;
    data['deposit'] = deposit;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
