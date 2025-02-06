class ReadMessageModel {
  final String messageContent;
  final String id;

  ReadMessageModel(this.messageContent, this.id);

  factory ReadMessageModel.fromJson(jsonData) {
    return ReadMessageModel(jsonData["body"], jsonData["id"]);
  }
}
