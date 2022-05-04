class InboxObject {
  int id;
  String? picture;
  String from;
  String? cc;
  String? bcc;
  String? subject;
  String body;
  String? attachment;
  DateTime? send;
  bool read;
  bool star;

  InboxObject({
    required this.id,
    this.picture,
    required this.from,
    this.cc,
    this.bcc,
    this.subject,
    required this.body,
    this.attachment,
    this.send,
    required this.read,
    required this.star,
  });
}

class OutboxObject {
  int id;
  String? picture;
  String to;
  String? cc;
  String? bcc;
  String? subject;
  String body;
  DateTime send;
  bool? star;

  OutboxObject({
    required this.id,
    this.picture,
    required this.to,
    this.cc,
    this.bcc,
    this.subject,
    required this.body,
    required this.send,
    this.star,
  });
}

class DraftObject {
  late final String? to;
  late final String? body;
  late final DateTime? date;

  DraftObject(
    String? to,
    String? body,
    DateTime? date,
  ) {
    this.to = to;
    this.body = body;
    this.date = date;
  }
}
