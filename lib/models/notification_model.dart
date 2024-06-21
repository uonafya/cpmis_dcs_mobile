class NotificationModel {
  String? text;
  String? category;
  String? timestamp;
  int? count;

  NotificationModel({this.text, this.category, this.timestamp, this.count});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    category = json['category'];
    timestamp = json['timestamp'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['category'] = category;
    data['timestamp'] = timestamp;
    data['count'] = count;
    return data;
  }
}
