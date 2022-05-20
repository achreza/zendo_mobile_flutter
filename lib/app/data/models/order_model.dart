class Order {
  int? id;
  String? status;
  String? customerName;
  String? customerAddress;
  int? deliveryFee;
  int? totalFee;
  int? driverId;
  String? note;
  String? createdAt;
  String? updatedAt;
  List<Destinations>? destinations;
  List<AdditionalFees>? additionalFees;

  Order(
      {this.id,
      this.status,
      this.customerName,
      this.customerAddress,
      this.deliveryFee,
      this.totalFee,
      this.driverId,
      this.note,
      this.createdAt,
      this.updatedAt,
      this.destinations,
      this.additionalFees});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    customerName = json['customer_name'];
    customerAddress = json['customer_address'];
    deliveryFee = json['delivery_fee'];
    totalFee = json['total_fee'];
    driverId = json['driver_id'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['destinations'] != null) {
      destinations = <Destinations>[];
      json['destinations'].forEach((v) {
        destinations!.add(Destinations.fromJson(v));
      });
    }
    if (json['additional_fees'] != null) {
      additionalFees = <AdditionalFees>[];
      json['additional_fees'].forEach((v) {
        additionalFees!.add(AdditionalFees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['customer_name'] = customerName;
    data['customer_address'] = customerAddress;
    data['delivery_fee'] = deliveryFee;
    data['total_fee'] = totalFee;
    data['driver_id'] = driverId;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (destinations != null) {
      data['destinations'] = destinations!.map((v) => v.toJson()).toList();
    }
    if (additionalFees != null) {
      data['additional_fees'] = additionalFees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Destinations {
  int? id;
  String? name;
  int? expenses;
  String? note;
  int? orderId;

  Destinations({this.id, this.name, this.expenses, this.note, this.orderId});

  Destinations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    expenses = json['expenses'];
    note = json['note'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['expenses'] = expenses;
    data['note'] = note;
    data['order_id'] = orderId;
    return data;
  }
}

class AdditionalFees {
  int? id;
  String? note;
  int? expenses;
  int? orderId;

  AdditionalFees({this.id, this.note, this.expenses, this.orderId});

  AdditionalFees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    expenses = json['expenses'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['note'] = note;
    data['expenses'] = expenses;
    data['order_id'] = orderId;
    return data;
  }
}
