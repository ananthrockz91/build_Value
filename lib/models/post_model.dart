import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_model.g.dart';

abstract class PostModel implements Built<PostModel, PostModelBuilder> {
  static Serializer<PostModel> get serializer => _$postModelSerializer;

  Children get data;

  factory PostModel([void Function(PostModelBuilder) updates]) = _$PostModel;
  PostModel._();
}

abstract class Children implements Built<Children, ChildrenBuilder> {
  static Serializer<Children> get serializer => _$childrenSerializer;

  BuiltList<Data> get children;

  factory Children([void Function(ChildrenBuilder) updates]) = _$Children;
  Children._();
}

abstract class Data implements Built<Data, DataBuilder> {
  static Serializer<Data> get serializer => _$dataSerializer;
  Post get data;

  factory Data([void Function(DataBuilder) updates]) = _$Data;
  Data._();
}

abstract class Post implements Built<Post, PostBuilder> {
  static Serializer<Post> get serializer => _$postSerializer;

  String get id;
  String get author;
  String get url;
  String get title;
  String get thumbnail;
  String get subreddit;
  int get ups;

  factory Post([void Function(PostBuilder) updates]) = _$Post;
  Post._();
}
