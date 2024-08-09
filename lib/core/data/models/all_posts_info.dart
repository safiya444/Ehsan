class All_Posts_Info {
  String? sId;
  String? typeOrder;
  String? content;
  String? site;
  String? phone;
  String? userTelegram;
  String? linkTelegram;
  int? iV;
 

  All_Posts_Info(
      {this.sId,
      this.typeOrder,
      this.content,
      this.site,
      this.phone,
      this.userTelegram,
      this.linkTelegram,
      this.iV,
      });

  All_Posts_Info.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    typeOrder = json['type_Order'];
    content = json['content'];
    site = json['site'];
    phone = json['phone'];
    userTelegram = json['user_Telegram'];
    linkTelegram = json['link_Telegram'];
    iV = json['__v'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type_Order'] = this.typeOrder;
    data['content'] = this.content;
    data['site'] = this.site;
    data['phone'] = this.phone;
    data['user_Telegram'] = this.userTelegram;
    data['link_Telegram'] = this.linkTelegram;
    data['__v'] = this.iV;
    
    return data;
  }
}
