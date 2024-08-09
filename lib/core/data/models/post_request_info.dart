class PostRequestInfo {
  String? typeOrder;
  String? content;
  String? site;
  String? userTelegram;
  String? linkTelegram;
  String? sId;
  int? iV;

  PostRequestInfo(
      {this.typeOrder,
      this.content,
      this.site,
      this.userTelegram,
      this.linkTelegram,
      this.sId,
      this.iV});

  PostRequestInfo.fromJson(Map<String, dynamic> json) {
    typeOrder = json['type_Order'];
    content = json['content'];
    site = json['site'];
    userTelegram = json['user_Telegram'];
    linkTelegram = json['link_Telegram'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_Order'] = this.typeOrder;
    data['content'] = this.content;
    data['site'] = this.site;
    data['user_Telegram'] = this.userTelegram;
    data['link_Telegram'] = this.linkTelegram;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}