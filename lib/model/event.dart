class EventModel {
  final String id;
  final String topicName;
  final String topicIcon;
  final String link;
  late String conditions;
  late String? number;
  late String? content;
  late bool? isConfirm;
  EventModel({
    required this.id,
    required this.topicIcon,
    required this.topicName,
    required this.link,
    required this.conditions,
    this.number,
    this.content,
    this.isConfirm,
  });
}
