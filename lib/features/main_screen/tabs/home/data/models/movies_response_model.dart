import 'data.dart';
import 'api_meta.dart';

class MoviesResponseModel {
  MoviesResponseModel({
      this.status, 
      this.statusMessage, 
      this.data, 
      this.meta,});

  MoviesResponseModel.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? ApiMeta.fromJson(json['@meta']) : null;
  }
  String? status;
  String? statusMessage;
  Data? data;
  ApiMeta? meta;


}