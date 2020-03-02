// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    Data data;

    Post({
        this.data,
    });

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

    Node({
        this.title,
        this.content,
        this.featuredImage,
    });

    factory Node.fromJson(Map<String, dynamic> json) => Node(
        title: json["title"],
        content: json["content"],
        featuredImage: json["featuredImage"] == null ? null : FeaturedImage.fromJson(json["featuredImage"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "featuredImage": featuredImage == null ? null : featuredImage.toJson(),
    };
}

class FeaturedImage {
    String sourceUrl;

    FeaturedImage({
        this.sourceUrl,
    });

    factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        sourceUrl: json["sourceUrl"],
    );

    Map<String, dynamic> toJson() => {
        "sourceUrl": sourceUrl,
    };
}
