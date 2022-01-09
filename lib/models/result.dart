

import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result{
final String? name;
final String? url;

Result(this.name, this.url);


factory Result.fromJson(Map<String,dynamic> json) =>_$ResultFromJson(json);

Map<String, dynamic> toJson() => _$ResultToJson(this);

}
