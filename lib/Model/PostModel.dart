// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

class Post {
    Data data;

    Post({
        this.data,
    });

    factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Posts posts;

    Data({
        this.posts,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        posts: Posts.fromJson(json["posts"]),
    );

    Map<String, dynamic> toJson() => {
        "posts": posts.toJson(),
    };
}

class Posts {
    List<Node> nodes;

    Posts({
        this.nodes,
    });

    factory Posts.fromRawJson(String str) => Posts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        nodes: List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nodes": List<dynamic>.from(nodes.map((x) => x.toJson())),
    };
}

class Node {
    String title;
    String content;
    FeaturedImage featuredImage;
    SpecialMessage specialMessage;

    Node({
        this.title,
        this.content,
        this.featuredImage,
        this.specialMessage,
    });

    factory Node.fromRawJson(String str) => Node.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Node.fromJson(Map<String, dynamic> json) => Node(
        title: json["title"],
        content: json["content"] == null ? null : json["content"],
        featuredImage: FeaturedImage.fromJson(json["featuredImage"]),
        specialMessage: SpecialMessage.fromJson(json["special_message"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content == null ? null : content,
        "featuredImage": featuredImage.toJson(),
        "special_message": specialMessage.toJson(),
    };
}

class FeaturedImage {
    String sourceUrl;

    FeaturedImage({
        this.sourceUrl,
    });

    factory FeaturedImage.fromRawJson(String str) => FeaturedImage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        sourceUrl: json["sourceUrl"],
    );

    Map<String, dynamic> toJson() => {
        "sourceUrl": sourceUrl,
    };
}

class SpecialMessage {
    String message;

    SpecialMessage({
        this.message,
    });

    factory SpecialMessage.fromRawJson(String str) => SpecialMessage.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SpecialMessage.fromJson(Map<String, dynamic> json) => SpecialMessage(
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
    };
}
