class EventModel {
  final String? eventType;
  final String? caseCategory;
  final String? dateOfEvent;
  final String? details;

  EventModel({
    required this.eventType,
    required this.caseCategory,
    required this.dateOfEvent,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      "event_type": eventType ?? '',
      'case_category': caseCategory ?? '',
      'date_of_event': dateOfEvent ?? '',
      'details': details ?? '',
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event_type'] = eventType ?? '';
    data['case_category'] = caseCategory ?? '';
    data['date_of_event'] = dateOfEvent ?? '';
    data['details'] = details ?? '';
    return data;
  }

  factory EventModel.fromJson(Map<String, dynamic> map) {
    return EventModel(
      eventType: map['event_type'] ?? '',
      caseCategory: map['case_category'] ?? '',
      dateOfEvent: map['date_of_event'].toString(),
      details: map['details'] ?? '',
    );
  }

  EventModel copyWith({
    String? eventType,
    String? caseCategory,
    String? dateOfEvent,
    String? details,
  }) {
    return EventModel(
      eventType: eventType ?? '',
      caseCategory: caseCategory ?? '',
      dateOfEvent: dateOfEvent ?? '',
      details: details ?? '',
    );
  }
}
