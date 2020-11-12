import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
    Client({
        this.count,
        this.pages,
        this.next,
        this.prev,
    });

    int count;
    int pages;
    String next;
    String prev;

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}